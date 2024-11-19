package com.wheelview

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReadableArray
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

  @ReactProp(name = "data")
    override fun setData(view: WheelViewView?, value: ReadableArray?) {
        val data = value?.toArrayList()?.map { it.toString() }
        view?.data = data
    }
    @ReactProp(name = "selectedIndex")
    override fun setSelectedIndex(view: WheelViewView?, value: Int) {
       view?.setSelectedItemPosition(value,false)
    }

  companion object {
    const val NAME = "WheelViewView"
  }
}
