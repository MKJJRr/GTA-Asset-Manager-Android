plugins {
    alias(libs.plugins.android.application) apply false
    alias(libs.plugins.kotlin.android) apply false
    
    // Agora o compilador do Compose também segue o padrão do TOML
    alias(libs.plugins.compose.compiler) apply false
}