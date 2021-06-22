# hxwebos

<div align="center">
  <img src="logo.png"><br><br>
  <p><a href="https://haxe.org">Haxe</a> externs for <a href="https://webostv.developer.lge.com/api/webostvjs/intro-webostvjs">webOSTV JavaScript library (webOSTV.js)</a> and it's related stuff!</p>
</div>

<br>

### Install and Usage

1. Install hxwebos with `haxelib install hxwebos` command.
2. See [webOS TV Developer](https://webostv.developer.lge.com) to find more info about how to work with webOS.
3. When you create webOS package/project, Create some sort of folder in the package directory.
4. In your Haxe code:

```haxe
import hxwebos.WebOS;
import hxwebos.WebOSDev;
import hxwebos.DRMAgent;
```

5. Build targeting JavaScript, Include built JavaScript source in main HTML file which is `index.html` then build webOS package.
6. Package and build webOS package/project via CLI or via the webOS IDE and have fun!

### Changes from JavaScript

The API of JavaScript is same from [webOS.js](https://webostv.developer.lge.com/api/webostvjs/webos) and [webOSDev.js](https://webostv.developer.lge.com/api/webostvjs/webosdev) and [DRMAgent](https://webostv.developer.lge.com/api/webostvjs/webosdev/drmagent) just with tiny changes like:

1. `webOSDev` stuff is in `WebOSDev` class which can be used as like JavaScript objects.
2. `webOS` stuff is in `WebOS` class which can be used as like JavaScript objects.
3. You can't access DRM type and error variables except via `WebOSDev.DRM.<Type/Error>.<type>` else use strings as it's allowed...
4. Improvements: Added some types to improve coding, See [helpers](#helpers) for more info.

### Example

```haxe
package;

import hxwebos.WebOS;
import hxwebos.WebOSDev;
import hxwebos.DRMAgent;

/**
 * ...
 * @author Rabia Alhaffar
 */
 
class Main 
{
    static function main() 
    {
        // You can launch webOS browser application.
        WebOSDev.launch({
            id: WebOSDev.APP.BROWSER,
            params: {
                target: "https://www.google.com",
            },
            onSuccess: function(res) {
                // do something
            },
            onFailure: function(res: WebOSFailureCallback) {
                trace("Error: " + res.errorText + ", Error code: " + res.errorCode);
            }
        });
    }
}
```

### Helpers

hxwebos provides some types to offer more fun when coding!

```haxe
// Function return type
// https://webostv.developer.lge.com/api/webostvjs/webos/?wos_flag=systemInfo#systemInfo
typedef WebOSSystemInfo = {
    var country: String;
    var smartServiceCountry: String;
    var timezone: String;
}

// Function return type
// https://webostv.developer.lge.com/api/webostvjs/webos/?wos_flag=systemInfo#systemInfo
typedef WebOSSystemInfo = {
    var country: String;
    var smartServiceCountry: String;
    var timezone: String;
}

// Callback result type
https://webostv.developer.lge.com/api/webostvjs/webos/?wos_flag=fetchAppInfo#fetchAppInfo
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

// Function parameter type for most DRMAgent functions
// https://webostv.developer.lge.com/api/webostvjs/webosdev/drmagent
typedef DRMAgentRightsError = {
    var onSuccess: haxe.Constraints.Function;
    var onFailure: haxe.Constraints.Function;
}

// Function parameter type
// https://webostv.developer.lge.com/api/webostvjs/webosdev/drmagent/?wos_flag=sendDrmMessage#sendDrmMessage
typedef DRMAgentMessage = {
    var msg: String;
    var onSuccess: haxe.Constraints.Function;
    var onFailure: haxe.Constraints.Function;
}
```

### License

```
This is free and unencumbered software released into the public domain.
Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
```

> NOTE: webOSTV SDK license provided in the source code...
