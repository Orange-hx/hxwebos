// Written by Rabia Alhaffar in June 21, 2021
// hxwebos, Haxe externs for webOSTV JavaScript library (webOSTV.js) and it's related stuff!
// Updated: June 22, 2021
package hxwebos;

import hxwebos.DRMAgent;

/**
 * ...
 * @author Rabia Alhaffar
 */
// Type for WebOSPeer type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=connectiongetStatus#
typedef WebOSWiFiWFDInfo = {
    var wfdCpSupport: Bool;
    var wfdDeviceType: String;
    var wfdRtspPort: Int;
    var wfdSessionAvail: Bool;
}

// Type for WebOSConnectionStatus type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=connectiongetStatus#
typedef WebOSPeer = {
    var deviceName: String;
    var deviceAddress: String;
    var groupOwner: Bool;
    var configMethod: Int;
    var signalLevel: Int;
    var wfdInfo: WebOSWiFiWFDInfo;
    var connected: Bool;
    var peerIp: String;
    var invited: String;
    var serviceDiscoveryResponse: String;
}

// Type for WebOSConnectionStatus type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=connectiongetStatus#
typedef WebOSWiFiDirect = {
    var state: String;
    var connectedPeers: Array<WebOSPeer>;
    var localIp: String;
}

// Type for WebOSConnectionStatus type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=connectiongetStatus#
typedef WebOSWired = {
    var state: String;
    var interfaceName: String;
    var ipAddress: String;
    var netmaks: String;
    var gateway: String;
    var dns1: String;
    var dns2: String;
    var dns3: String;
    var method: String;
    var onInternet: String;
}

// Type for WebOSConnectionStatus type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=connectiongetStatus#
typedef WebOSWiFi = {
    var state: String;
    var interfaceName: String;
    var ipAddress: String;
    var netmaks: String;
    var gateway: String;
    var dns1: String;
    var dns2: String;
    var dns3: String;
    var method: String;
    var ssid: String;
    var isWakeOnWiFiEnabled: Bool;
    var onInternet: String;
}

// Callback result type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=connectiongetStatus#connectiongetStatus
typedef WebOSConnectionStatus = {
    var isInternetConnectionAvailable: Bool;
    var wired: WebOSWired;
    var wifi: WebOSWiFi;
    var wifiDirect: WebOSWiFiDirect;
}

// Function parameter type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=connectiongetStatus#connectiongetStatus
typedef WebOSConnectionParams = {
    var onSuccess: haxe.Constraints.Function;
    var onFailure: haxe.Constraints.Function;
    var subscribe: Bool;
}

// Function parameter type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=launch#launch
typedef WebOSAppParams = {
    var id: String;
    var params: Dynamic;
    var onSuccess: haxe.Constraints.Function;
    var onFailure: haxe.Constraints.Function;
}

// Function parameter type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=LGUDID#LGUDID
typedef WebOSLGUDIDParams = {
    var onSuccess: haxe.Constraints.Function;
    var onFailure: haxe.Constraints.Function;
}

// Callback result type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/?wos_flag=LGUDID#LGUDID
typedef WebOSDeviceInfo = {
    var id: String;
}

@:native("webOSDev")
extern class WebOSDev {
    extern static var APP: WebOSDevApp;
    extern static var DRM: WebOSDevDRM;
    extern static var connection: WebOSDevConnection;
    extern public static function launch(params: WebOSAppParams): Void;
    extern public static function launchParams(): Dynamic;
    extern public static function LGUDID(parameters: WebOSLGUDIDParams): Void;
}

class WebOSDevApp {
	extern public var BROWSER(default, null): String;
}

class WebOSDevDRM {
    extern public var Type(default, null): DRMType;
    extern public var Error(default, null): DRMError;
}

class WebOSDevConnection {
    extern public function getStatus(parameters: WebOSConnectionParams): Void;
}
