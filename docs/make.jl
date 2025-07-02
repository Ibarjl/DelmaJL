push!(LOAD_PATH, "../src/")
using Documenter, DelmaJL

makedocs(
    sitename = "DelmaJL Documentation",
    format = Documenter.HTML(),
    modules = [DelmaJL],
    pages = [
        "Home" => "index.md",
        "Manual" => [
            "Getting Started" => "manual/getting_started.md",
            "Core Functionality" => "manual/core.md",
            "Data Handling" => "manual/data_handling.md",
            "GUI" => "manual/gui.md",
            "Utils" => "manual/utils.md"
        ],
        "API" => "api.md"
    ]
)
