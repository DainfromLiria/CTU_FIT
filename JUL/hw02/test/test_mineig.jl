
# In some cases it is neccessary to relax the precision requirements.
const EPS = 1e-6

@testset "$(rpad("Exceptions.",TITLE_WIDTH))" begin
    # expected exceptions
    @test_throws ArgumentError mineig([1 2 3; 4 5 6])
    @test_throws ArgumentError mineig([1 0; 1 0])
    @test_throws ArgumentError mineig([1 0; 0 4], 4)
    @test_throws ErrorException mineig([1 2; 3 4], max_iter=0)
    @test_throws ArgumentError mineig([1.0 2.0; 3.0 4.0], epsilon=-1.0)
    @test_throws ArgumentError mineig([1.0 2.0; 3.0 4.0], norm_epsilon=-1.0)
    @test_throws ArgumentError mineig([1.0 2.0; 3.0 4.0], max_iter=-100)
end

@testset "$(rpad("Matrices with complex (floating point) coefficients.",TITLE_WIDTH))" begin
    # diagonal 3x3 matrix
    A = diagm([1.0im, 2, 3im])

    λ, x = mineig(A)

    @test λ ≈ 1.0im

    # diagonalizable 3x3 matrix
    A = diagm([0.9, 1im, 1.1])
    U = [1 1 -1; 1 -1 1; -1 1 1]
    A = inv(U) * A * U

    λ, x = mineig(A)

    @test λ ≈ 0.9

    # diagonalizable 10x10 matrix
    A = diagm([ (-1im)^k * (1 + 0.1 * k) for k = 0:9 ])
    U = [ (0.1 * k)^j for k = 1:10, j = 1:10]
    A = inv(U) * A * U

    λ, x = mineig(A, epsilon=100EPS)

    @test λ ≈ 1 atol=1000EPS

    # searching for close eigenvalues
    A = diagm([1, 2im, 3, 4im])
    U = [ (0.1 * k)^j for k = 1:4, j = 1:4]
    A = inv(U) * A * U

    λ, x = mineig(A, 3.1)

    @test λ ≈ 3
end

@testset "$(rpad("Matrices with real (floating point) coefficients.", TITLE_WIDTH))" begin
    A = diagm([1., 2.])

    λ, x = mineig(A) 

    @test λ ≈ 1.0
    @test norm(A * x - λ * x) ≈ 0 atol=100EPS
end

@testset "$(rpad("Matrices with rational coefficients.", TITLE_WIDTH))" begin
    A = diagm([1//2, 2//3])

    λ, x = mineig(A, epsilon=100EPS)

    @test λ ≈ 1/2 atol=1000EPS
end

@testset "$(rpad("Matrices with integer coefficients.", TITLE_WIDTH))" begin
    A = diagm([1, 2])

    λ, x = mineig(A) 

    @test λ ≈ 1.0
    @test norm(A * x - λ * x) ≈ 0 atol=100EPS
end

@testset "$(rpad("Matrices with big integer coefficients.", TITLE_WIDTH))" begin
    A = BigInt[1 0; 0 2]

    λ, x = mineig(A)

    @test λ ≈ 1.0
    @test norm(A * x - λ * x) ≈ 0 atol=100EPS
end

@testset "$(rpad("Matrices with big float coefficients.", TITLE_WIDTH))" begin
    A = BigFloat[1 0; 0 2]

    λ, x = mineig(A) 

    @test λ ≈ 1.0
    @test norm(A * x - λ * x) ≈ 0 atol=100EPS
end

@testset "$(rpad("Matrices with non-unique 'smallest dominant' eigenvalue.", TITLE_WIDTH))" begin
  A = diagm([1., -1., 2.])

  @test_throws ErrorException mineig(A)

  A = [0. 1.; -1. 0.]
  
  @test_throws ErrorException mineig(A)
end

@testset "$(rpad("An example of a larger matrix.",TITLE_WIDTH))" begin
    # diagonal 10x10 matrix
    A = diagm([0.5 * k^2 for k = 1:10])
    # Vandermonde
    U = [ (-j/10)^k for j = 1:10, k = 1:10 ]
    A = inv(U) * A * U

    λ, x = mineig(A, epsilon=EPS)
    @test λ ≈ 0.5 atol=1000EPS

    λ, x = mineig(A, 8.2, epsilon=EPS)
    @test λ ≈ 8 atol=1000EPS

    λ, x = mineig(A, 30, epsilon=EPS)
    @test λ ≈ 32 atol=1000EPS
end