using HTTP
using JSON
using Base64 # Para codificar la clave de API si la pones en el header, aunque usar environment variables es mejor.

# --- Configuración de la Clave de API ---
# Es CRÍTICO NO incrustar tu clave de API directamente en el código.
# La mejor práctica es usar variables de entorno.
# Por ejemplo, puedes establecer GEMINI_API_KEY en tu sistema:
# En Linux/macOS: export GEMINI_API_KEY="TU_CLAVE_API_AQUI"
# En Windows (PowerShell): $env:GEMINI_API_KEY="TU_CLAVE_API_AQUI"

const GEMINI_API_KEY = get(ENV, "GEMINI_API_KEY", "")

if isempty(GEMINI_API_KEY)
    error("La variable de entorno GEMINI_API_KEY no está configurada. Por favor, configura tu clave de API de Gemini.")
end

# --- Función para interactuar con Gemini ---
function generate_text_with_gemini(prompt_text::String; model_name::String="gemini-pro")
    api_url = "https://generativelanguage.googleapis.com/v1beta/models/$(model_name):generateContent?key=$(GEMINI_API_KEY)"

    headers = Dict(
        "Content-Type" => "application/json"
    )

    body = Dict("contents" => [Dict("parts" => [Dict("text" => prompt_text)])])

    try
        response = HTTP.post(api_url, headers, JSON.json(body))

        if response.status == 200
            json_response = JSON.parse(String(response.body))
            # Navegar por la estructura de la respuesta para obtener el texto
            if haskey(json_response, "candidates") && !isempty(json_response["candidates"])
                if haskey(json_response["candidates"][1], "content") &&
                    haskey(json_response["candidates"][1]["content"], "parts") &&
                    !isempty(json_response["candidates"][1]["content"]["parts"])
                    return json_response["candidates"][1]["content"]["parts"][1]["text"]
                end
            end
            return "Respuesta de Gemini inesperada: $(json_response)"
        else
            return "Error de la API de Gemini: Estado $(response.status)\n$(String(response.body))"
        end
    catch e
        return "Error al comunicarse con la API de Gemini: $(e)"
    end
end

# --- Ejemplo de uso ---
if abspath(PROGRAM_FILE) == @__FILE__
    println("Generando texto con Gemini...")

    my_prompt = "Escribe una función de Julia para calcular la secuencia de Fibonacci de forma recursiva."
    generated_code = generate_text_with_gemini(my_prompt)
    println("\nCódigo generado por Gemini:")
    println(generated_code)

    another_prompt = "¿Cuál es la capital de España y por qué es importante históricamente?"
    explanation = generate_text_with_gemini(another_prompt)
    println("\nExplicación de Gemini:")
    println(explanation)
end