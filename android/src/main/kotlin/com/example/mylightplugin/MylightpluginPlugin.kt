package com.example.mylightplugin

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.content.Context
import android.hardware.camera2.CameraAccessException
import android.hardware.camera2.CameraManager
import android.os.BatteryManager;

/** MylightpluginPlugin */
class MylightpluginPlugin: FlutterPlugin, MethodCallHandler {
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "mylightplugin")
    context = flutterPluginBinding.applicationContext
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "turnOnLight" -> turnOnlight(result)
      "turnOffLight" -> turnOfflight(result)
      "getBatteryLevel" -> getBatteryLevel(result)
      else -> result.notImplemented()
    }
  }

  private fun turnOnlight(result: Result) {
    val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager
    try {
      val cameraId = cameraManager.cameraIdList[0]
      cameraManager.setTorchMode(cameraId, true)
      result.success(null)
    } catch (e: CameraAccessException) {
      result.error("CAMERA_ACCESS_ERROR", "Failed to access the camera for flashlight.", null)
    }
  }

  private fun turnOfflight(result: Result) {
    val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager
    try {
      val cameraId = cameraManager.cameraIdList[0]
      cameraManager.setTorchMode(cameraId, false)
      result.success(null)
    } catch (e: CameraAccessException) {
      result.error("CAMERA_ACCESS_ERROR", "Failed to access the camera for flashlight.", null)
    }
  }



  private fun getBatteryLevel(result: Result) {
    val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
    val batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
    if (batteryLevel != -1) {
      result.success(batteryLevel)
    } else {
      result.error("BATTERY_LEVEL_ERROR", "Failed to get battery level.", null)
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
