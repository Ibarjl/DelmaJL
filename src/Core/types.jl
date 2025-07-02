struct Item
    id::String
    nombre::String
    categoria::String
    cantidad::Int
    ubicacion::String
end

struct Solicitud
    id::String
    item_id::String
    cantidad::Int
    fecha::DateTime
    estado::Symbol  # :pendiente, :aprobada, :rechazada
    solicitante::String
end
