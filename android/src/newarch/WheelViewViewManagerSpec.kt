package com.wheelview

import android.view.View

import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.viewmanagers.WheelViewViewManagerDelegate
import com.facebook.react.viewmanagers.WheelViewViewManagerInterface

abstract class WheelViewViewManagerSpec<T : View> : SimpleViewManager<T>(), WheelViewViewManagerInterface<T> {
  private val mDelegate: ViewManagerDelegate<T>

  init {
    mDelegate = WheelViewViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<T>? {
    return mDelegate
  }
}
