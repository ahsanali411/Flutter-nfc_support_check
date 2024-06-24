package com.example.flutter_nfc_supported_check

import android.nfc.NfcAdapter
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity(){
    private val CHANNEL = "MethodChannelToCheckNFCSupport"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "isNFCSupported") {
                println("My Method channel invoked successfully");

                val nfcAdapter: NfcAdapter? = NfcAdapter.getDefaultAdapter(this)
                result.success(nfcAdapter != null)
            } else {
                result.notImplemented()
            }
        }

    }
}
