:: GC, JIT, and AOT logging on
..\jre_j9\bin\java.exe ^
   -Xaot:verbose ^
   -Xverbosegclog:./openj9_logs/gc_log.txt ^
   -Xjit:verbose,vlog=./openj9_logs/jit_log ^
   -Xshareclasses:none ^
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
