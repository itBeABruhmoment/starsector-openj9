# starsector-openj9
This is a kit for making Starsector use OpenJ9. 

# Windows Installation
1. Download OpenJ9 from https://developer.ibm.com/languages/java/semeru-runtimes/downloads/. Version 23.0.2.0 was used for this guide but other versions likely work
2. Find the path to your Starsector installation location. The default is "C:\Program Files (x86)\Fractal Softworks\Starsector"
3. Copy the path to the OpenJ9 zip you downloaded
4. Run .\windows_openj9_install.bat "C:\Path\To\Starsector" "C:\Path\To\some-prefix-openj9-some-version.zip"
5. Run the game with "Starsector\starsector-core\j9_starsector.bat"

# JVM Command Line Options of Interest
Read the docs for exact details on options https://eclipse.dev/openj9/docs

## Performance
1. XX:+AlwaysPreTouch : Makes the JVM allocate the maximum amount of heap space set by Xmx / Xms. This will likely significantly increases RAM usage, and benchmarking experiments did not indicate performance improvements.
2. Xmoi : The amount of memory the heap grows / shrinks by at a time. Likely has little impact on performance.
3. Xaggressive : Seems to result in minor performance improvements.
4. XtlhPrefetch : Does not seem to improve performance from benchmarking. Windows only.
5. Xmint / Xmaxt : Specify the min and max fraction of time to spend on garbage collection. Generally, smaller ranges mean more memory usage and less time spend on GC.
6. Xshareclasses : Creates a sort of cache file. Suspected cause of stuttering and does not seem to improve average fps from benchmarking.
7. Xmx / Xms : Heap size
8. Xmn : Nursery size for gencon (default) GC policy. Larger values result in longer but less frequent garbage collection events. Avoid large values to avoid stuttering.

## Troubleshooting
1. Xverbosegclog : Logs garbage collector data into a file. Logs can be viewed with tools like gceasy.io. Long GC times can be the cause of stuttering
2. Xjit : Contains logging options for the JIT
3. Xaot : Contains logging options for the AOT. j9_starsector.bat disables class sharing so it shouldn't be active.
