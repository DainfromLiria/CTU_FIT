
import .Billiard: Segment, Arc

@testset "$(rpad("Arc type.", TITLE_WIDTH))" begin
    # constructor
    @test isa(Arc([1., 2.], 3., 1., 2.), Arc)
    @test isa(Arc([1., 2.], 3., pi, 2pi), Arc)
    @test isa(Arc([1., 2.], 3., -pi, 2pi), Arc)
    # wrong dimensions
    @test_throws ArgumentError Arc([1., 2., 3.], 1., 1., 2.)
    @test_throws ArgumentError Arc([1.], 1., 1., 2.)
    # invalid radius
    @test_throws ArgumentError Arc([1., 2.], -1., 1., 2.)
    # invalid angles
    @test_throws ArgumentError Arc([1., 2.], 1., 2., 1.)
    @test_throws ArgumentError Arc([1., 2.], 1., 2., 2.)
end

@testset "$(rpad("Segment type.", TITLE_WIDTH))" begin
    # constructor
    @test isa(Segment([1., 2.], [2., 1.]), Segment)
    # wrong dimensions
    @test_throws ArgumentError Segment([1., 2., 3.], [1., 2.])
    @test_throws ArgumentError Segment([1., 2.], [1., 2., 3.])
    @test_throws ArgumentError Segment([1., 2., 3.], [1., 2., 3.])
    # almost identical endpoints
    @test_throws ArgumentError Segment([1., 2.], [1., 2.] .+ eps(Float64))
end
