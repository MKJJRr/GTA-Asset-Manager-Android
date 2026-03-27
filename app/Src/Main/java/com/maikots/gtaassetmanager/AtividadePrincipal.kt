package com.maikots.gtaassetmanager

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import com.maikots.gtaassetmanager.ui.GtaAssetExplorer
import com.maikots.gtaassetmanager.valores.Tema.AppTheme

// Importando minhas libs customizadas (v1.0)
import libsktmk.splash_control.*
import libsktmk.Interface_Imersiva.*

class AtividadePrincipal : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        
        // 1. Controla a Splash Screen (Segura o XML na tela)
        SplashControl.configurar(this, tempoEspera = 2500)
        
        super.onCreate(savedInstanceState)
        
        // 2. Configura a Interface Imersiva (Substitui as +10 linhas manuais)
        InterfaceImersiva.ativar(this)
        
        setContent {
            AppTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = Color.Black 
                ) {
                    GtaAssetExplorer()
                }
            }
        }
    }

    override fun onResume() {
        super.onResume()
        // 3. Garante que o app continue em tela cheia ao voltar do sistema
        InterfaceImersiva.atualizar(window)
    }
}