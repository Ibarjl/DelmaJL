module Core

include("types.jl")
include("stock.jl")
include("solicitudes.jl")

export Item, Solicitud
export get_stock, update_stock
export create_solicitud, process_solicitud

end # module
