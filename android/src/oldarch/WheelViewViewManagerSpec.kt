package com.wheelview

import android.view.View
import com.facebook.react.uimanager.SimpleViewManager


abstract class WheelViewViewManagerSpec<T : View> : SimpleViewManager<T>() {
  fun setData(view: T, @Nullable value: ReadableArray?)
  fun setSelectedIndex(view: T, value: Int)
}
