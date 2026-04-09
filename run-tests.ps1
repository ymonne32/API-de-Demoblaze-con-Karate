Write-Host "Ejecutando pruebas Karate..."
mvn clean test

if ($LASTEXITCODE -eq 0) {
    Write-Host "Pruebas finalizadas correctamente."
    Write-Host "Reporte Karate: target/karate-reports/karate-summary.html"
} else {
    Write-Host "Las pruebas finalizaron con errores."
    exit $LASTEXITCODE
}
