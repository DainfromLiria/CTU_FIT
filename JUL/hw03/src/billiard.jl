"""

Draw and simulate motion of a particle confined to a billiard with boundary
formed by line segments and circular arcs.

"""
module Billiard

export Arc, Segment, Table
export simulate!, draw_path, draw_poincare

using LinearAlgebra
using Luxor

#
# Types
#

abstract type Obstacle end


"""

    Segment(A, B)

Obstacle formed by a line segment connecting points `A` and `B`.

"""
struct Segment <: Obstacle
    A::Vector{Float64}
    B::Vector{Float64}
    # ...you may wish to add other attributes...

    # ...custom constructor...
    function Segment(A::Vector{Float64}, B::Vector{Float64})
        if length(A) != 2 || length(B) != 2
            throw(ArgumentError("Vector of points coordinates must have two elements"))
        end

        if isapprox(A, B)
            throw(ArgumentError("Start and end point is too near or equal"))
        end

        return new(A, B)
    end
end


@doc raw"""

    Arc(C, R, α, β)

Obstacle formed by a circular arc defined by the circle of radius `R` and
center `C`, and specified by the polar coordinates `α` and `β` (measured counter clock-wise with respect to `R` and with the angle running from ``-π`` to ``π``, the direction of the positive ``x`` axis corresponds to
the angle ``0``).

More precisely, the circular arc is parametrized by ``x = R \cos(t)`` and
``y = R \sin(t)` for ``t ∈ ⟨α, β⟩`` where ``α < β``.

"""
struct Arc <: Obstacle
    C::Vector{Float64}
    R::Float64
    α::Float64
    β::Float64
    # ...you may wish to add other attributes...

    # ...custom constructor...
    # α and β is Real for input values with pi
    function Arc(C::Vector{Float64}, R::Float64, α::Real, β::Real) 
        if α >= β
            throw(ArgumentError("α must be less than  β"))
        end

        if length(C) != 2
            throw(ArgumentError("Vector C must have two elements"))
        end

        if R < 0
            throw(ArgumentError("Radius R must be a positive number"))
        end
        
        return new(C, R, α, β)
    end
end


"""

    Table(obstacles)

The billiard table is formed by number of obstacles.

"""
struct Table
    obstacles::Vector{<:Obstacle}
    # ...you may need to add other...

    # ...custom constructor...
    function Table(obstacles::Vector{<:Obstacle})
        return new(obstacles)
    end
end

# Show count of obstacles in input Table
Base.show(io::IO, x::Table)  = print(io, "Created table has $(length(x.obstacles)) obstacles")

#
# Functions and methods
#

"""

    simulate!(table, path)

Run the simulation on the `table`.
First two rows of `path` represent position, last two velocity.
The first column holds the initial condition, the rest is overwritten. 
"""
function simulate!(table::Table, path::Matrix{Float64})
    check_args(path) 

    C::Vector{Float64} = [path[1], path[2]]
    u::Vector{Float64} = [path[3], path[4]]

    for i in range(2, size(path, 2))
        
        current_min::Vector{Float64}, sgm_min = find_point(table, path, u, C, i)

        if current_min == [Inf, Inf]
            throw(ErrorException("RuntimeError: impact not found"))
        else
            C = copy(current_min)
            if typeof(sgm_min) == Segment
                sv = velocity_vector_segment(sgm_min.A, sgm_min.B, u)
            else
                sv = velocity_vector_arc(sgm_min.C, current_min, u)
            end
            u = copy(sv)
            append!(current_min, sv)
            path[:, i] = current_min
        end
    end
end


"""

    draw_path(table, path)

Draw the `table` and a `path`.

"""
function draw_path(table::Table, path::Matrix{Float64})
    @svg begin
        setline(2)
        sethue("black")
        for sgm in table.obstacles
            if typeof(sgm) == Segment
                line(Point(sgm.A[1], sgm.A[2]), Point(sgm.B[1], sgm.B[2]), action = :stroke)
            else
                arc(Point(sgm.C[1], sgm.C[2]), sgm.R, sgm.α, sgm.β, action = :stroke)
            end
        end
        setline(1)
        sethue("red")
        for i in range(1, size(path, 2)-1)
            line(Point(path[1:2, i][1], path[1:2, i][2]), Point(path[1:2, i+1][1], path[1:2, i+1][2]), action = :stroke)
        end
    end
end


"""

    draw_poincare(paths, P1, P2)

Draw the Poincaré section from array of trajectories (`paths`) and defined
by segment with endpoints `P1` and `P2`.

"""
function draw_poincare(paths, P1::Vector{Float64}, P2::Vector{Float64})
    @svg begin
        origin()
        background("white")
        scale(270, 180) # optimal scale
        for path in paths
            randomhue()
            for i in range(1, size(path, 2)-1)

                C = [path[1:2, i][1], path[1:2, i][2]]
                u = [path[3:4, i][1], path[3:4, i][2]]
                v = P2 - P1
                D = [u[1] (-v[1]); u[2] (-v[2])]
                b = [P1[1] - C[1], P1[2] - C[2]]
                result = D \ b
    
                if result[1] >= 0 && result[2] >= 0 && result[2] <= 1
                    angle = atan(u[2], u[1])
                    point = [result[2], angle]

                    circle(Point(point[1], point[2]), 0.005, :fill)
                end
            end
        end
    end
end


"""
    check_args(path) 

Check if input path matrix has 4 rows and columns count is grater than 2

"""
function check_args(path::Matrix{Float64})
    if size(path, 1) != 4 || size(path, 2) < 2
        throw(ArgumentError("Matrix must be 4xn, where n must be greater than 2."))
    end    
end


"""
    function find_point(table, path, u, C, i)

Find nearest obstacle. Return obstacle and  point of inpact with it.

"""
function find_point(table::Table, path::Matrix{Float64}, u::Vector{Float64}, C::Vector{Float64}, i::Int64)
    current_min::Vector{Float64} = [Inf, Inf]
    sgm_min::Obstacle = table.obstacles[1]

    for sgm in table.obstacles
        if typeof(sgm) == Segment
            res = calculate_point_line(sgm.A, sgm.B, C, u)
        else
            res = calculate_point_arc(sgm.C, sgm.R, C, u, sgm.α, sgm.β)
        end

        if length(res) != 0 
            for rs in res
                if isapprox(path[1:2, i-1], rs) == false && is_min(current_min, rs, C) == true
                    current_min = rs
                    sgm_min = sgm
                end
            end
        end

    end

    return current_min, sgm_min
end


"""
    function is_min(current_min_point, point, C)

Check if new point is closer to C than current minimum point.

"""
function is_min(current_min_point::Vector{Float64} , point::Vector{Float64} , C::Vector{Float64})
    curr_min = norm(current_min_point - C)
    new_min = norm(point - C)
    if new_min < curr_min
        return true
    else
        return false
    end
end


"""
    calculate_point_line(A, B, C, u)

    Find point of impact on line segment using system of linear equation. 
    For inverse use A^-1 = 1/det(A) * adj(A), where adj(A) is adjugate matrix.
    If point of inpact is on the line segment AB, then result[1] >= 0 and result[2] is between (0,1). 
"""
function calculate_point_line(A::T, B::T, C::T, u::T) where { T <: Vector{Float64} }
    
    results = Vector{Vector{Float64}}()
    v = B - A
    b = [A[1] - C[1], A[2] - C[2]]
    D_inv = (1 / ((u[1]*(-v[2])) - (u[2]*(-v[1])))) * [(-v[2]) v[1]; (-u[2]) u[1]]
    result = D_inv * b

    if result[1] >= 0 && result[2] >= 0 && result[2] <= 1 
        x1 = C[1] + (u[1]*result[1])
        y1 = C[2] + (u[2]*result[1])
        push!(results, [x1, y1])
    end

    return results
end


"""
    solve_equation(S, R, C, u)

Solve circle equation using current ball point and velocity vector. 

"""
function solve_equation(S::Vector{T}, R::T, C::Vector{T}, u::Vector{T}) where { T <: Float64 }
    result = Vector{Float64}()

    a = u[1]^2 + u[2]^2
    b = 2*(((C[1] - S[1]) * u[1]) + ((C[2] - S[2]) * u[2]))
    c = (C[1] - S[1])^2 + (C[2] - S[2])^2 - R^2

    D = b^2 - (4 * a * c)

    if D < 0
        return result
    elseif isapprox(D, 0)
        push!(result, (-b / (2*a)))
    else
        push!(result, ((-b + sqrt(D)) / (2*a)))
        push!(result, ((-b - sqrt(D)) / (2*a)))
    end

    return result

end


"""
    calculate_point_arc(S, R, C, u, alpha, beta)

Find point of impact on arc using quadratic equation.

"""
function calculate_point_arc(S::Vector{T}, R::T, C::Vector{T}, u::Vector{T}, alpha::T, beta::T) where { T <: Float64 }

    results = Vector{Vector{Float64}}()

    solution = solve_equation(S, R, C, u)
    if length(solution) == 0
        return results
    end

    x_f = C[1] + (u[1] * solution[1])
    y_f = C[2] + (u[2] * solution[1])

    if check_validity(x_f, y_f, S, alpha, beta) == true
        push!(results, [x_f, y_f])
    end


    if length(solution) == 2
        x_s = C[1] + (u[1] * solution[2])
        y_s = C[2] + (u[2] * solution[2])

        if check_validity(x_s, y_s, S, alpha, beta) == true
           push!(results, [x_s, y_s])
        end
    end

    return results
end


"""
    check_validity(x, y, S, alpha, beta) 

Using formula for angle between two vectors, check if point is on arc.

"""
function check_validity(x::T, y::T, S::Vector{T}, alpha::T, beta::T) where { T <: Float64 }
    A = [x - S[1], y - S[2]] # vector from center of circle to point
    B = [1, 0] # positive direction of x

    theta = dot(A, B) / (sqrt(dot(A, A)) * sqrt(dot(B, B)))
    angle = acos(theta)

    if angle < alpha || angle > beta
        return false
    end

    return true
end


"""
    velocity_vector_segment(A, B, u)

Find new velocity vector after inpact with segment. 

"""
function velocity_vector_segment(A::T, B::T, u::T) where { T <: Vector{Float64} }
    AB = B - A
    s = [AB[1] / norm(AB), AB[2] / norm(AB)]
    n = [s[2], -s[1]]

    velocity_vector = (dot(s,u)*s)-(dot(n,u)*n)
    return velocity_vector
end


"""
    velocity_vector_arc(S, D, u)

Find new velocity vector after inpact with arc. 
D is point of inpact. S is center of circle. u is current velocity vector.

"""
function velocity_vector_arc(S::T, D::T, u::T) where { T <: Vector{Float64} }
    n = S - D
    n = [n[1] / norm(n), n[2] / norm(n)]
    s = [n[2], -n[1]]

    velocity_vector = (dot(s,u)*s)-(dot(n,u)*n)
    return velocity_vector
end

end # module
