module STLDecomposition

using stldecomposition_jll

export call_stl, call_stlez

# Define the Julia function to call the Fortran subroutine
function call_stl(
    y::Vector{Float64}, n::Int, np::Int, ns::Int, nt::Int, nl::Int, 
    isdeg::Int, itdeg::Int, ildeg::Int, 
    nsjump::Int, ntjump::Int, nljump::Int, ni::Int, no::Int)

    # Initialize arrays
    rw = similar(y)
    season = similar(y)
    trend = similar(y)
    work = Vector{Float64}(undef, (n+2*np)*7)

    @ccall libstldecomposition.stl_(
        y::Ref{Float64}, n::Ref{Int64}, np::Ref{Int64}, ns::Ref{Int64}, nt::Ref{Int64}, nl::Ref{Int64}, 
        isdeg::Ref{Int64}, itdeg::Ref{Int64}, ildeg::Ref{Int64}, 
        nsjump::Ref{Int64}, ntjump::Ref{Int64}, nljump::Ref{Int64}, ni::Ref{Int64}, no::Ref{Int64}, 
        rw::Ref{Float64}, season::Ref{Float64}, trend::Ref{Float64}, work::Ref{Float64}
    )::Cvoid

    return season, trend
end


function call_stlez(y::Vector{Float64}, n::Int, np::Int, ns::Int,isdeg::Int, itdeg::Int, robust::Bool)

    # Initialize counter and arrays
    nconv = 0
    rw = similar(y)
    season = similar(y)
    trend = similar(y)
    work = Vector{Float64}(undef, (n+2*np)*7)

    @ccall libstldecomposition.stlez_(
        y::Ref{Float64}, n::Ref{Int64}, np::Ref{Int64}, ns::Ref{Int64},
        isdeg::Ref{Int64}, itdeg::Ref{Int64}, robust::Ref{Bool}, nconv::Ref{Int64}, 
        rw::Ref{Float64}, season::Ref{Float64}, trend::Ref{Float64}, work::Ref{Float64}
    )::Cvoid

    return season, trend
end

end
