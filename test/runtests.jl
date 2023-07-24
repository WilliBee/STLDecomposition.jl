using STLDecomposition
using Test

@testset "STLDecomposition.jl" begin
    file = open("co2.txt")
    lines = readlines(file)
    
    # CO2 data from original implementation https://www.netlib.org/a/stl
    y = parse.(Float64, split(lines[1]))
    
    # Expected results from Fortran with function stl
    season_stl_fortran = parse.(Float64, split(lines[2]))
    trend_stl_fortran = parse.(Float64, split(lines[3]))
    
    # Expected results from Fortran with function stlez
    season_stlez_fortran = parse.(Float64, split(lines[5]))
    trend_stlez_fortran = parse.(Float64, split(lines[6]))

    # Example usage:
    robust = false
    n=348
    np=12
    ns=35
    nt=19
    nl=13
    no=2
    ni=1
    nsjump=4
    ntjump=2
    nljump=2
    isdeg=1
    itdeg=1
    ildeg=1

    season_stl_julia, trend_stl_julia = call_stl(y, n, np, ns, nt, nl, isdeg, itdeg, ildeg, nsjump, ntjump, nljump, ni, no)

    @test season_stl_julia == season_stl_fortran
    @test trend_stl_julia  == trend_stl_fortran

    season_stlez_julia, trend_stlez_julia = call_stlez(y, n, np, ns, isdeg, itdeg, true)

    @test season_stlez_julia == season_stlez_fortran
    @test trend_stlez_julia  == trend_stlez_fortran
end