plugins {
    alias(libs.plugins.android.application)
    alias(libs.plugins.kotlin.android)
    alias(libs.plugins.compose.compiler) // Agora usando o alias do TOML!
}
//
//
// LÓGICA DO INTERRUPTOR 
//
// (Pega o nome do modo do arquivo na raiz)
val modoAtivo = project.rootDir.listFiles()
    ?.find { it.name.startsWith("build-Types=") }
    ?.name?.substringAfter("=") ?: "debug"
//
// 
// EXPORTA O NOME DO MODO 
//
project.extra.set("modoAtivo", modoAtivo)
//
//
// APLICAÇÃO DOS SCRIPTS
//
// Primeiro o Android Base, depois o
// Modo (para o modo ter a última palavra)
apply(from = "../config-android.gradle")
apply(from = "../config-modo-$modoAtivo.gradle")
apply(from = "../config-dependencies.gradle")



android {
    @Suppress("DEPRECATION")
    kotlinOptions {
        jvmTarget = "11"
    }
}