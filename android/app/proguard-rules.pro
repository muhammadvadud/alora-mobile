# Flutter wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Sentry
-keep class io.sentry.** { *; }
-dontwarn io.sentry.**

# just_audio
-keep class com.ryanheise.just_audio.** { *; }

# image_cropper
-keep class com.yalantis.ucrop.** { *; }
-keep class vn.hunghd.flutter.plugins.imagecropper.** { *; }

# Connectivity, path_provider, url_launcher, shared_preferences, etc. are handled by Flutter's default rules, but we can be safe:
-keep class dev.fluttercommunity.plus.connectivity.** { *; }
-keep class io.flutter.plugins.urllauncher.** { *; }
-keep class io.flutter.plugins.pathprovider.** { *; }

# Flutter deferred components (Play Core) ishlatilmaydi — R8 missing-class ogohlantirishlari
-dontwarn com.google.android.play.core.**
-dontwarn io.flutter.embedding.engine.deferredcomponents.**
-dontwarn io.flutter.embedding.android.FlutterPlayStoreSplitApplication
