# Script para construir y preparar el sitio para Hostinger
# Ejecuta este script cada vez que quieras actualizar tu sitio

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host "   IA Insurance - Build para Hostinger" -ForegroundColor Cyan
Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""

# 1. Limpiar builds anteriores
Write-Host "🗑️  Limpiando builds anteriores..." -ForegroundColor Yellow
if (Test-Path "dist") {
    Remove-Item -Recurse -Force "dist"
    Write-Host "✅ Build anterior eliminado" -ForegroundColor Green
}
Write-Host ""

# 2. Construir proyecto para producción
Write-Host "🔨 Construyendo proyecto para producción..." -ForegroundColor Yellow
ng build --configuration production
Write-Host ""

# 3. Verificar que el build fue exitoso
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Build completado exitosamente!" -ForegroundColor Green
    Write-Host ""
    
    # 4. Mostrar resumen
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "   📦 ARCHIVOS LISTOS PARA SUBIR" -ForegroundColor Cyan
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📁 Ubicación:" -ForegroundColor Yellow
    Write-Host "   $PWD\dist\iaseguros-web\browser\" -ForegroundColor White
    Write-Host ""
    Write-Host "📋 Archivos generados:" -ForegroundColor Yellow
    Get-ChildItem "dist\iaseguros-web\browser\" | ForEach-Object {
        $size = if ($_.PSIsContainer) { "Carpeta" } else { "{0:N2} KB" -f ($_.Length / 1KB) }
        Write-Host "   ✓ $($_.Name)" -ForegroundColor Green -NoNewline
        Write-Host " ($size)" -ForegroundColor Gray
    }
    Write-Host ""
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host "   📤 PRÓXIMOS PASOS" -ForegroundColor Cyan
    Write-Host "=====================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Abre Hostinger:" -ForegroundColor Yellow
    Write-Host "   → https://www.hostinger.com" -ForegroundColor White
    Write-Host ""
    Write-Host "2. Ve al Administrador de Archivos" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "3. Navega a public_html" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "4. Sube TODOS los archivos de:" -ForegroundColor Yellow
    Write-Host "   → dist\iaseguros-web\browser\" -ForegroundColor White
    Write-Host ""
    Write-Host "5. ¡Visita tu sitio web!" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "💡 Tip: Lee TUTORIAL-HOSTINGER.md para instrucciones detalladas" -ForegroundColor Cyan
    Write-Host ""
    
} else {
    Write-Host "❌ Error en el build. Revisa los errores anteriores." -ForegroundColor Red
    Write-Host ""
}

Write-Host "=====================================" -ForegroundColor Cyan
Write-Host ""
