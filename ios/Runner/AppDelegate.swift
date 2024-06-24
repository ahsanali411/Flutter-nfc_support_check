import UIKit
import CoreNFC
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
          let nfcChannel = FlutterMethodChannel(name: "MethodChannelToCheckNFCSupport",
                                                binaryMessenger: controller.binaryMessenger)
          nfcChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if (call.method == "isNFCSupported") {
                print("My IOS Method Channel to Check NFC is called")
              if #available(iOS 11.0, *) {
                result(NFCNDEFReaderSession.readingAvailable)
              } else {
                result(false)
              }
            } else {
              result(FlutterMethodNotImplemented)
            }
          }
      
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
