module DataHandling

include("unified_handler.jl")
include("file_io.jl")
include("database.jl")
include("search_engine.jl")

export UnifiedDataHandler
export read_data, write_data
export connect_db, query_db
export search_items

end # module
