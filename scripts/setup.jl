using Pkg

# Activar el entorno del proyecto
Pkg.activate(@__DIR__)

# Instalar dependencias
Pkg.add([
    "CSV",
    "DataFrames",
    "JSON",
    "SQLite",
    "YAML",
    "XMLDict",
    "Gtk"
])

# Precompilar paquetes
Pkg.precompile()
