
@testset "$(rpad("Argument types.", TITLE_WIDTH))" begin
    for T in [Int32, Int64, Int128, UInt32, UInt64, UInt128, BigInt]
        @test catalan(T(3)) == T(5)
    end

    @test_throws MethodError catalan("10")
    @test_throws MethodError catalan(10.0)
end

@testset "$(rpad("Return types.", TITLE_WIDTH))" begin
    for T in [Int32, Int64, Int128, UInt32, UInt64, UInt128, BigInt]
        @test catalan(T(3)) isa T
    end
end

@testset "$(rpad("Invalid arguments.", TITLE_WIDTH))" begin
    @test_throws ArgumentError catalan(-1)
    @test_throws ArgumentError catalan(rand(-100:-2))
end

@testset "$(rpad("First few values.", TITLE_WIDTH))" begin
    @test catalan(0)  ==      1
    @test catalan(1)  ==      1
    @test catalan(2)  ==      2
    @test catalan(3)  ==      5
    @test catalan(4)  ==     14
    @test catalan(5)  ==     42
    @test catalan(6)  ==    132
    @test catalan(7)  ==    429
    @test catalan(8)  ==  1_430
    @test catalan(9)  ==  4_862
    @test catalan(10) == 16_796
    @test catalan(11) == 58_786
end

@testset "$(rpad("Randomized test of one of the recurrence equations.", TITLE_WIDTH))" begin
    n = UInt64(rand(20:30))
    @test catalan(n) == sum([catalan(i - 1) * catalan(n - i) for i = 1:n])
end

