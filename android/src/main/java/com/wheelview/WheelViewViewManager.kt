package com.wheelview

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.annotations.ReactProp

@ReactModule(name = WheelViewViewManager.NAME)
class WheelViewViewManager :
  WheelViewViewManagerSpec<WheelViewView>() {
  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): WheelViewView {
    return WheelViewView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: WheelViewView?, color: String?) {
    view?.setBackgroundColor(Color.parseColor(color))
  }

  companion object {
    const val NAME = "WheelViewView"
  }
}
