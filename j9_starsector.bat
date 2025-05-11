:: options of note
:: Xaggressive: some optimization option, seems to improve performance

:: XtlhPrefetch: some windows only optimization option, based on testing (3 samples) seems to have no impact on performance

:: Xmint / Xmaxt: target fraction of time spent on GC, heap will grow / shrink based on target (set range higher to trade higher performance for more memory usage)

:: Xmca / Xmco: amount of memory to expand / shrink JVM RAM and ROM

:: Xmn: nursery heap area size. Setting it higher will increase throughput but result in longer GC pauses (stuttering)

:: JIT log: -Xjit:verbose={compilePerformance},vlog=./jit/jit.log ^ 
:: GC log: -Xverbosegclog ^ 

:: Enable / disable shared classes. From benchmarking (3 samples), shared classes does not seem to produce a statistically 
:: significant difference. It takes disk space and I suspect it causes stutters so it stays off
:: -Xshareclasses:cacheDir=./openj9_cache ^
:: -Xshareclasses:none ^

:: Related to loading shared classes
:: -Xaot


..\jre_j9\bin\java.exe ^
   -Xshareclasses:cacheDir=none ^
   -Xmnx500m ^
   -Xmint0.00 ^
   -Xmaxt0.01 ^
   -Xmoi8m ^
   -noverify ^
   -Xaggressive ^
   -XX:+CompactStrings ^
   -XX:+ShowCodeDetailsInExceptionMessages ^
   -XX:+PrintCodeCache ^
   -XX:+FlightRecorder ^
   -Djava.library.path=native\\windows ^
   -Djava.util.Arrays.useLegacyMergeSort=true ^
   --enable-preview ^
   --add-opens=java.base/sun.nio.ch=ALL-UNNAMED ^
   --add-opens=java.base/java.nio=ALL-UNNAMED ^
   --add-opens=java.base/java.nio.Buffer.UNSAFE=ALL-UNNAMED ^
   --add-opens=java.base/java.util=ALL-UNNAMED ^
   --add-opens=java.base/java.util.concurrent=ALL-UNNAMED ^
   --add-opens=java.base/java.util.concurrent.locks=ALL-UNNAMED ^
   --add-opens=java.base/jdk.internal.ref=ALL-UNNAMED ^
   --add-opens=java.base/java.lang.reflect=ALL-UNNAMED ^
   --add-opens=java.base/java.lang.ref=ALL-UNNAMED ^
   --add-opens=java.base/java.text=ALL-UNNAMED ^
   --add-opens=java.desktop/java.awt.font=ALL-UNNAMED ^
   --add-opens=java.desktop/java.awt.Rectangle=ALL-UNNAMED ^
   --add-opens=java.desktop/java.awt=ALL-UNNAMED ^
   --add-exports=java.base/jdk.internal.ref=ALL-UNNAMED ^
   --add-exports=java.base/jdk.internal.misc=ALL-UNNAMED ^
   --add-exports=java.base/sun.nio.ch=ALL-UNNAMED ^
   -Xmx4096m ^
   -Xms4096m ^
   -Xss4m ^
   -Dcom.fs.starfarer.settings.paths.saves=../saves ^
   -Dcom.fs.starfarer.settings.paths.screenshots=../screenshots ^
   -Dcom.fs.starfarer.settings.paths.mods=../mods ^
   -Dcom.fs.starfarer.settings.paths.logs=. ^
   -classpath janino.jar;commons-compiler.jar;commons-compiler-jdk.jar;starfarer.api.jar;starfarer_obf.jar;jogg-0.0.7.jar;jorbis-0.0.15.jar;json.jar;lwjgl.jar;jinput.jar;log4j-1.2.9.jar;lwjgl_util.jar;fs.sound_obf.jar;fs.common_obf.jar;xstream-1.4.10.jar;txw2-3.0.2.jar;jaxb-api-2.4.0-b180830.0359.jar;webp-imageio-0.1.6.jar com.fs.starfarer.StarfarerLauncher
@echo off
if errorlevel 1 {
   pause
}
