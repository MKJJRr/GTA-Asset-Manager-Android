# --- 1. CONFIGURAÇÕES DE ATRIBUTOS E METADADOS ---
# Mantém informações cruciais para o funcionamento de bibliotecas e relatórios de erro
-keepattributes SourceFile,LineNumberTable,Signature,InnerClasses,EnclosingMethod,RuntimeVisibleAnnotations,RuntimeVisibleParameterAnnotations,AnnotationDefault
-renamesourcefileattribute SourceFile

# --- 2. SUPRESSÃO DE AVISOS (Build mais limpo) ---
-dontwarn kotlin.**
-dontwarn org.jetbrains.kotlin.**
-dontwarn androidx.**
-dontwarn com.google.android.material.internal.**

# --- 3. REGRAS DO PROJETO GTA ASSET MANAGER ---
# Protege seus serviços e lógica principal contra renomeação agressiva
-keep class com.maikots.gtaassetmanager.servicos.** { *; }

# --- 4. JETPACK COMPOSE & MATERIAL 3 ---
# Essencial para o Compose não quebrar ao tentar renderizar UI ofuscada
-keep class androidx.compose.** { *; }
-keep class androidx.compose.material3.** { *; }
-keep interface androidx.compose.** { *; }
-keep class com.google.android.material.common.StaticLayoutBuilder { *; }

# --- 5. LIFECYCLE, VIEWMODELS E VIEWS ---
-keepclassmembers class * extends androidx.lifecycle.ViewModel {
    public <init>(...);
}

-keep public class * extends android.view.View {
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util.AttributeSet);
    public <init>(android.content.Context, android.util.AttributeSet, int);
    public void set*(...);
}

# --- 6. COROUTINES (Evita quebra de fluxo assíncrono) ---
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}
-keepclassmembernames class kotlinx.coroutines.android.HandlerContext {
    private volatile y.b.a.a.g.a _h;
}

# --- 7. OTIMIZAÇÕES AGRESSIVAS DE RELEASE ---
# Reduz o número de passagens para economizar tempo de CPU no JStudio
-optimizationpasses 1
-allowaccessmodification
-overloadaggressively
-repackageclasses ''
-useuniqueclassmembernames

# Desativa simplificações que exigem muito processamento e podem causar bugs no Dexing
-optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

# --- 8. LIMPEZA DE LOGS (Opcional - Remove logs de Debug no Release) ---
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# Ignora metadados do Kotlin que o R8 antigo não entende (Acelera o Build)
-dontwarn kotlin.metadata.**
-keepattributes !KotlinMetadata