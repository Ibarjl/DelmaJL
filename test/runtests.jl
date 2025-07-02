using Test
using DelmaJL

@testset "DelmaJL Tests" begin
    include("test_core.jl")
    include("test_datahandling.jl")
    include("test_gui.jl")
end
