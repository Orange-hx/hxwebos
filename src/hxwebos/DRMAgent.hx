// Written by Rabia Alhaffar in June 21, 2021
// hxwebos, Haxe externs for webOSTV JavaScript library (webOSTV.js) and it's related stuff!
// Updated: June 22, 2021
package hxwebos;

import haxe.extern.EitherType;

/**
 * ...
 * @author Rabia Alhaffar
 */
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

// NOTE: Only accessible from WebOSDev.DRM.Type, If you want to access these globally then use strings instead.
class DRMType {
    extern public var PLAYWAVE(default, null): String;
    extern public var SINE(default, null): String;
}

// NOTE: Only accessible from WebOSDev.DRM.Error, If you want to access these globally then use strings instead.
class DRMError {
    extern public var NOT_ERROR(default, null): Int;
    extern public var CLIENT_NOT_LOADED(default, null): Int;
    extern public var VENDOR_ERROR(default, null): Int;
    extern public var API_NOT_SUPPORTED(default, null): Int;
    extern public var WRONG_CLIENT_ID(default, null): Int;
    extern public var KEY_NOT_FOUND(default, null): Int;
    extern public var INVALID_PARAMS(default, null): Int;
    extern public var UNSUPPORTED_DRM_TYPE(default, null): Int;
    extern public var INVALID_KEY_FORMAT(default, null): Int;
    extern public var DRM_TYPE_UNMATCHED(default, null): Int;
    extern public var UNKNOWN_ERROR(default, null): Int;
}

@:native("DRMAgent")
class DRMAgent {
    public function new(type: EitherType<String, DRMType>) {}
    extern public function getClientId(): String;
    extern public function getDrmType(): String;
    extern public function getErrorCode(): Int;
    extern public function getErrorText(): String;
    extern public function getRightsError(params: DRMAgentRightsError): Void;
    extern public function isLoaded(params: DRMAgentRightsError): Void;
    extern public function load(params: DRMAgentRightsError): Void;
    extern public function sendDrmMessage(params: DRMAgentRightsError): Void;
    extern public function unload(params: DRMAgentMessage): Void;
}
