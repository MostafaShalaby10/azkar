# Keep Flutter location plugin classes
-keep class com.lyokone.location.** { *; }

# Keep method references used by platform channels
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Keep classes used by reflection
-keepclassmembers class * {
    *;
}

# Sometimes necessary for Kotlin and Flutter interop
-dontwarn kotlin.**
-dontwarn com.lyokone.location.**
