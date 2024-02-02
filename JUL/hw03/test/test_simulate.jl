
@testset "$(rpad("arguments of simulate!", TITLE_WIDTH))" begin
    table = Table([Segment([-1.0, -1.0], [ 1.0, -1.0])])
    @test_throws ArgumentError simulate!(table, zeros(2, 4))
    @test_throws ArgumentError simulate!(table, zeros(4, 1))
end

@testset "$(rpad("simulate! exceptions", TITLE_WIDTH))" begin
    table = Table([Segment([0., .0], [ 1.0, 0.0])])
    path = zeros(4, 3)
    path[1:4, 1] = [0.5, 1.0, 0., -1.0]

    @test_throws ErrorException simulate!(table, path)
end

@testset "$(rpad("simulate! with a rectangle", TITLE_WIDTH))" begin
    table = Table([
        Segment([-1.0, -1.0], [ 1.0, -1.0]),
        Segment([ 1.0, -1.0], [ 1.0,  1.0]),
        Segment([ 1.0,  1.0], [-1.0,  1.0]),
        Segment([-1.0,  1.0], [-1.0, -1.0])
    ])
    path = hcat([1., 0., -1., 1.], zeros(4, 4))

    simulate!(table, path)

    @test isapprox(path[:, 2], [ 0.,  1., -1., -1.])
    @test isapprox(path[:, 3], [-1.,  0.,  1., -1.])
    @test isapprox(path[:, 4], [ 0., -1.,  1.,  1.])
    @test isapprox(path[:, 5], [ 1.,  0., -1.,  1.])
end

import LinearAlgebra: norm

@testset "$(rpad("simulate! with a circle", TITLE_WIDTH))" begin
    # disk with center O and radius 1
    table = Table([
        Arc([0., 0.], 1.0, -pi, pi)
    ])

    # start at O
    path = hcat([0., 0., 1., 0.], zeros(4, 2))
    simulate!(table, path)

    @test isapprox(path[:, 2], [ 1.,  0., -1., 0.])
    @test isapprox(path[:, 3], [-1.,  0.,  1., 0.])

    path = hcat([0., 0., 0., 1.], zeros(4, 2))
    simulate!(table, path)

    @test isapprox(path[:, 2], [ 0.,  1., 0., -1.])
    @test isapprox(path[:, 3], [ 0.,  -1.,  0., 1.])

    # start inside close to O
    path = hcat([0., 0.2, 1., 1.], zeros(4, 2))
    simulate!(table, path)

    @test isapprox(norm(path[1:2, 2]), 1)
    @test isapprox(norm(path[1:2, 3]), 1)

    # shoot from outside
    path = hcat([-2., 0., 1., 0.], zeros(4, 1))
    simulate!(table, path)

    @test isapprox(path[:, 2], [-1., 0., -1., 0.])

    path = hcat([-2., -0.1, 1., -0.1], zeros(4, 1))
    simulate!(table, path)

    @test isapprox(norm(path[1:2, 2]), 1)
    @test path[1, 2] < 0
    @test path[2, 2] < 0
    @test path[3, 2] < 0
    @test path[4, 2] < 0
end