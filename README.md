# DelmaJL

DelmaJL es un sistema de gestión de componentes electrónicos implementado en Julia.

## Características

- Gestión de inventario de componentes electrónicos
- Sistema de solicitudes y aprobaciones
- Interfaz gráfica intuitiva
- Soporte para múltiples formatos de datos
- Motor de búsqueda avanzado

## Instalación

```julia
using Pkg
Pkg.add(url="https://github.com/tuusuario/DelmaJL.jl")
```

## Uso Básico

```julia
using DelmaJL

# Crear un nuevo item
item = Item("001", "Resistencia 10k", "Resistencias", 100, "A1")

# Crear una solicitud
solicitud = create_solicitud("001", 10, "Juan Pérez")
```

## Licencia

Este proyecto está licenciado bajo AGPL-3.0.
