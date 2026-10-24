Feature: POST /idiomas - validación del contrato en producción

  # El Background centraliza la base URL del servidor de producción y los headers comunes.
  Background:
    * url 'https://labqa-api-rest-crud-basic-tqa.onrender.com/api/v1'
    * configure headers = { Accept: 'application/json', Content-Type: 'application/json' }

  Scenario: Crear idioma con payload válido y validar el tipo de datos de la respuesta
    # Se envía un payload válido conforme al contrato OpenAPI.
    * def payload =
      """
      {
        "idioma": "Francés",
        "descripcion": "Idioma hablado en Francia"
      }
      """

    Given path '/idiomas'
    And request payload
    When method post
    Then status 201
    # La respuesta debe devolver un objeto con estructura esperada; solo verificamos tipos.
    And match response == { id: '#number', idioma: '#string', descripcion: '#string' }

  Scenario Outline: Crear idioma con diferentes payloads y validar respuesta completa <idioma>,
    # Se valida el cuerpo completo sustituyendo el valor del id por un chequeo de tipo.
    * def payload =
      """
      {
        "idioma": "<idioma>",
        "descripcion": "<descripcion>"
      }
      """

    Given path '/idiomas'
    And request payload
    When method post
    Then status 201
    And match response == { id: '#number', idioma: '<idioma>', descripcion: '<descripcion>' }

    Examples:
      | idioma   | descripcion                                  |
      | Francés  | Idioma hablado en Francia                   |
      | Alemán   | Idioma hablado principalmente en Alemania   |
