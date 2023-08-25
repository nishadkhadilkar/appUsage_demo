package com.example.app_usage

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.pandorabio.pandora_bio_app/appUsage"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getAppUsage") {
                /// Write your code for app usage
                // Pass your json encoded string in this ----> result.success()
               // Handle error message like this ---->  result.error("UNAVAILABLE", "App Usage not available.", null)
            } else {
                result.notImplemented()
            }
        }
    }
}
