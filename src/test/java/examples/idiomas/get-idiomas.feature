Feature: GET /idiomas/{id} - validación del contrato en producción

  # El Background centraliza la URL base del servidor de producción y los headers comunes.
  Background:
    * url 'https://labqa-api-rest-crud-basic-tqa.onrender.com/api/v1'
    * configure headers = { Accept: 'application/json' }

  Scenario: Obtener un idioma por ID y validar el tipo de dato del body
    # El endpoint debe responder con un objeto completo y con estructura esperada.
    Given path 'idiomas', 10
    When method get
    Then status 200
    And match response == { id: '#number', idioma: '#string', descripcion: '#string' }

  Scenario: Obtener un idioma por ID y validar solo el valor del campo id
    # Validamos el campo clave del contrato y dejamos el resto del payload sin una validación rígida.
    Given path 'idiomas', 5
    When method get
    Then status 200
    And match response.id == 5

