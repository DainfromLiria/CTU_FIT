using BenchmarkTools
using  LinearAlgebra

"""

    maxeig(A; epsilon, norm_epsilon, max_iter)

Attempt to compute the donimant eigenvalue of `A`.

"""
function maxeig(
    A::Matrix{Complex{T}};
    epsilon::T = sqrt(eps(T)),
    norm_epsilon::T = epsilon * length(A),
    max_iter::Integer = 1_000
) where { T <: AbstractFloat }
  
  check_args(epsilon, norm_epsilon, max_iter, A)

  n = size(A, 1)
  x_k = rand(Complex{T}, n)
  lamda_prev = Inf

  for i in 1:max_iter
    x_kk = A * x_k
    x_kk = x_kk / norm(x_kk)
    lamda_current = dot(x_kk, A, x_kk) / dot(x_kk, x_kk)

    if (abs(lamda_current - lamda_prev) < epsilon) && (norm(A*x_kk - lamda_current*x_kk) < norm_epsilon)
      return (lamda_current, x_kk)
    end

    x_k = x_kk
    lamda_prev = lamda_current
  end

  throw(ErrorException("Eigenvalue for this input parameters not found."))
end

maxeig(
    A::Matrix{T};
    epsilon::Real = sqrt(eps(Float64)),
    norm_epsilon::Real = epsilon * length(A),
    max_iter::Integer = 1_000
) where { T <: Real } =
    maxeig(Complex{Float64}.(A), epsilon=epsilon, norm_epsilon=norm_epsilon, max_iter=max_iter)

"""

    mineig(A, mu; epsilon, norm_epsilon, max_iter)

Attempt to compute the eigenvalue of `A` closest to `mu`.

"""
function mineig(
    A::Matrix{Complex{T}}, mu=Complex{T}(0);
    epsilon::T = sqrt(eps(T)),
    norm_epsilon::T = epsilon * length(A),
    max_iter::Integer = 1_000
) where { T <: AbstractFloat }
  
  check_args(epsilon, norm_epsilon, max_iter, A)

  n = size(A, 1)
  tmp = A - (mu*I(n))
  
  # if matrix is singular catch it and throw ArgumentError
  try
    B = lu(tmp) # use lu decomposition to solve B*x_kk = x_k
    x_k = rand(Complex{T}, n)
    lamda_prev = Inf

    for i in 1:max_iter
      x_kk = B \ x_k
      x_kk = x_kk / norm(x_kk)
      lamda_current = dot(x_kk, A * x_kk) / dot(x_kk, x_kk)

      if (abs(lamda_current - lamda_prev) < epsilon) && (norm(A*x_kk - lamda_current*x_kk) < norm_epsilon)
        return (lamda_current, x_kk)
      end

      x_k = x_kk
      lamda_prev = lamda_current
    end

  catch 
    throw(ArgumentError("Singular matrix not allowed."))
  end

  throw(ErrorException("Eigenvalue for this input parameters not found."))
end

mineig(
  A::Matrix{T}, mu=T(0);
  epsilon::Real = sqrt(eps(Float64)),
  norm_epsilon::Real = epsilon * length(A),
  max_iter::Integer = 1_000
) where { T <: Real } =
    mineig(Complex{Float64}.(A), Complex{Float64}(mu), epsilon=epsilon, norm_epsilon=norm_epsilon, max_iter=max_iter)



# Function for check input value validity   
function check_args(epsilon, norm_epsilon, max_iter, A)
  if epsilon < 0 || norm_epsilon < 0 || max_iter < 0
    throw(ArgumentError("Negative number not allowed."))
  end
  
  if size(A, 1) != size(A, 2)
    throw(ArgumentError("Matrix is not square matrix."))
  end
end