PROYECTO: EJERCICIO 2 - PRUEBAS API DEMOBLAZE CON KARATE + JAVASCRIPT

1) Prerrequisitos
- Java JDK 17 o superior
- Maven 3.9 o superior
- Acceso a internet (la API probada es externa)

2) Estructura principal del proyecto
- pom.xml: configuracion Maven y dependencias Karate
- src/test/java/demoblaze/demoblaze-api.feature: escenarios API
- src/test/java/demoblaze/helpers.js: funciones JavaScript para datos dinamicos
- src/test/java/demoblaze/DemoblazeRunner.java: runner JUnit 5
- run-tests.ps1: script de ejecucion para Windows PowerShell
- conclusiones.txt: hallazgos del ejercicio

3) Tecnologia utilizada
- Karate DSL para pruebas REST
- JavaScript embebido en Karate para generar usuarios unicos y reutilizar datos de prueba
- Maven como orquestador de ejecucion y reportes

4) Casos implementados
- Crear un nuevo usuario en signup
- Intentar crear un usuario ya existente
- Usuario y password correcto en login
- Usuario y password incorrecto en login

5) Ejecucion paso a paso
Paso 1. Abrir una terminal en la raiz del proyecto.
Paso 2. Ejecutar:
        mvn clean test
        (alternativa en PowerShell: .\run-tests.ps1)

6) Reportes generados
- Reporte HTML resumido:
  target/karate-reports/karate-summary.html
- Reporte HTML por feature:
  target/karate-reports/demoblaze.demoblaze-api.html
- Archivos JSON y JUnit XML para evidencia:
  target/karate-reports/*.json
  target/surefire-reports/*.xml

7) Nota sobre entradas y salidas
Cada escenario imprime en consola la entrada enviada y la salida recibida usando sentencias print de Karate.
Estas trazas tambien quedan reflejadas en el reporte HTML.


