// Written by Rabia Alhaffar in June 21, 2021
// hxwebos, Haxe externs for webOSTV JavaScript library (webOSTV.js) and it's related stuff!
// Updated: June 22, 2021
package hxwebos;

/**
 * ...
 * @author Rabia Alhaffar
 */
// Function return type
// https://webostv.developer.lge.com/api/webostvjs/webos/?wos_flag=systemInfo#systemInfo
typedef WebOSSystemInfo = {
    var country: String;
    var smartServiceCountry: String;
    var timezone: String;
}

// Callback result type
// https://webostv.developer.lge.com/api/webostvjs/webos/?wos_flag=fetchAppInfo#fetchAppInfo
typedef WebOSApp = {
    var id: String;
    var version: String;
    var vendor: String;
    var type: String;
    var main: String;
    var title: String;
    var icon: String;
    var largeIcon: String;
}

// Callback result type
// https://webostv.developer.lge.com/api/webostvjs/webos/?wos_flag=deviceInfo#deviceInfo
typedef WebOSDevice = {
    var modelName: String;
    var modelNameAscii: String;
    var version: String;
    var versionMajor: Int;
    var versionMinor: Int;
    var versionDot: Int;
    var sdkVersion: String;
    var screenWidth: Int;
    var screenHeight: Int;
    var uhd: Bool;
    var uhd8K: Bool;
    var oled: Bool;
    var ddrSize: String;
    var hdr10: Bool;
    var dolbyVision: Bool;
    var dolbyAtmos: Bool;
}

// Function parameter type
// https://webostv.developer.lge.com/api/webostvjs/webos/?wos_flag=request#request
typedef WebOSRequest = {
    var method: String;
    var parameters: Dynamic;
    var subscribe: Bool;
    var resubscribe: Bool;
    var onSuccess: haxe.Constraints.Function;
    var onFailure: haxe.Constraints.Function;
    var onComplete: haxe.Constraints.Function;
}

// onFailure callback function result
typedef WebOSFailureCallback = {
    var returnValue: Bool;
    var errorCode: Int;
    var errorText: String;
}

@:native("webOS")
extern class WebOS {
    extern public static var libVersion(default, null): String;
    extern public static function deviceInfo(devicecallback: haxe.Constraints.Function): Void;
    extern public static function fetchAppId(): String;
    extern public static function fetchAppInfo(callback: haxe.Constraints.Function, path: String): Void;
    extern public static function fetchAppRootPath(): String;
    extern public static function platformBack(): Void;
    extern public static function systemInfo(): WebOSSystemInfo;
    extern static var platform: WebOSPlatform;
    extern static var keyboard: WebOSKeyboard;
    extern static var service: WebOSService;
    extern static var appInfo: WebOSAppInfo;
}

class WebOSAppInfo {
    extern public var id(default, null): String;
    extern public var version(default, null): String;
    extern public var vendor(default, null): String;
    extern public var type(default, null): String;
    extern public var main(default, null): String;
    extern public var title(default, null): String;
    extern public var icon(default, null): String;
    extern public var largeIcon(default, null): String;
}

class WebOSService {
    extern public function request(uri: String, ?param: WebOSRequest): Dynamic;
}

class WebOSPlatform {
    extern public var tv(default, null): Bool;
}

class WebOSKeyboard {
    extern public function isShowing(): Bool;
}
