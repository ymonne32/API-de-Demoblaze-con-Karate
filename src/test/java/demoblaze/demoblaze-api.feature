Feature: Validar servicios signup y login de Demoblaze

  Background:
    * url 'https://api.demoblaze.com'
    * def helpers = call read('classpath:demoblaze/helpers.js')
    * def username = helpers.uniqueUser('sofka')
    * def password = helpers.strongPassword()
    * def isSignupSuccess =
    """
    function(res){
      var normalized = karate.toString(res).trim();
      return normalized == '' || normalized == '""' || (karate.typeOf(res) == 'map' && karate.sizeOf(res) == 0);
    }
    """

  Scenario: Crear un nuevo usuario en signup
    Given path 'signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match isSignupSuccess(response) == true
    * print 'Entrada -> signup nuevo usuario:', { username: username, password: password }
    * print 'Salida  -> signup nuevo usuario:', response

  Scenario: Intentar crear un usuario ya existente
    Given path 'signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match isSignupSuccess(response) == true

    Given path 'signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match response.errorMessage == 'This user already exist.'
    * print 'Entrada -> signup usuario existente:', { username: username, password: password }
    * print 'Salida  -> signup usuario existente:', response

  Scenario: Usuario y password correcto en login
    Given path 'signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match isSignupSuccess(response) == true

    Given path 'login'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match karate.toString(response) contains 'Auth_token:'
    * print 'Entrada -> login correcto:', { username: username, password: password }
    * print 'Salida  -> login correcto:', response

  Scenario: Usuario y password incorrecto en login
    Given path 'signup'
    And request { username: '#(username)', password: '#(password)' }
    When method post
    Then status 200
    And match isSignupSuccess(response) == true

    * def wrongPassword = password + '_incorrecto'
    Given path 'login'
    And request { username: '#(username)', password: '#(wrongPassword)' }
    When method post
    Then status 200
    And match response.errorMessage == 'Wrong password.'
    * print 'Entrada -> login incorrecto:', { username: username, password: wrongPassword }
    * print 'Salida  -> login incorrecto:', response