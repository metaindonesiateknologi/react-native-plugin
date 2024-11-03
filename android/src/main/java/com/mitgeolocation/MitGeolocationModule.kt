package com.mitgeolocation

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise

class MitGeolocationModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  init {
    System.loadLibrary("mit_flutter_plugin") // Replace "my_rust_lib" with the actual name of your Rust library
  }

  override fun getName(): String {
    return NAME
  }

  external fun searchAddressByCoord(lat: String, lon: String, appid: String, token: String): String
  external fun searchAddressByName(search: String, lat: String, lon: String, appid: String, token: String): String
  external fun searchMapRoute(start: String, startLat: String, startLon: String, dest: String, destLat: String, destLon: String, appid: String, token: String): String

  @ReactMethod
  fun searchAddressByCoord(lat: String, lon: String, token: String, promise: Promise) {
      try {
          val appid = reactApplicationContext.packageName
          val result = searchAddressByCoord(lat, lon, appid, token)
          promise.resolve(result)
      } catch (e: Exception) {
          promise.reject("Error", e)
      }
  }

  @ReactMethod
  fun searchAddressByName(search: String, token: String, promise: Promise) {
      try {
          val appid = reactApplicationContext.packageName
          val result = searchAddressByName(search, "", "", appid, token)
          promise.resolve(result)
      } catch (e: Exception) {
          promise.reject("Error", e)
      }
  }

  @ReactMethod
  fun searchMapRoute(start: String, startLat: String, startLon: String, dest: String, destLat: String, destLon: String, token: String, promise: Promise) {
      try {
          val appid = reactApplicationContext.packageName
          val result = searchMapRoute(start, startLat, startLon, dest, destLat, destLon, appid, token)
          promise.resolve(result)
      } catch (e: Exception) {
          promise.reject("Error", e)
      }
  }

  companion object {
    const val NAME = "MitGeolocation"
  }
}
