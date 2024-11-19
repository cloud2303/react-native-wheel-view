package com.wheelview

import android.content.Context
import android.graphics.Color
import com.aigestudio.wheelpicker.WheelPicker
import com.facebook.react.bridge.Arguments
import com.facebook.react.bridge.ReactContext
import com.facebook.react.bridge.WritableMap
import com.facebook.react.uimanager.PixelUtil
import com.facebook.react.uimanager.UIManagerHelper
import com.facebook.react.uimanager.events.Event

class WheelViewView(context: Context) : WheelPicker(context){
 init {
    this.setAtmospheric(true)
        this.isCurved = true
        this.setVisibleItemCount(5)
        this.selectedItemTextColor= Color.parseColor("#000000")
        this.setCurtain(true)
        this.itemTextSize = PixelUtil.toPixelFromDIP(22.0).toInt()
        this.curtainColor=Color.parseColor("#33f1f3f5")
        this.setOnItemSelectedListener { _, data, position ->
            emitOnItemSelected(data.toString(), position)
      }
  }
  private fun emitOnItemSelected(data: String, position: Int) {
        val reactContext = context as ReactContext
        val surfaceId = UIManagerHelper.getSurfaceId(reactContext)
        val eventDispatcher = UIManagerHelper.getEventDispatcherForReactTag(reactContext, id)
        val payload =
            Arguments.createMap().apply {
                putString("data", data)
                putInt("position", position)
            }
        val event = OnItemSelectedEvent(surfaceId, id, payload)

        eventDispatcher?.dispatchEvent(event)
    }
    inner class OnItemSelectedEvent(
        surfaceId: Int,
        viewId: Int,
        private val payload: WritableMap
    ) : Event<OnItemSelectedEvent>(surfaceId, viewId) {
        override fun getEventName() = "onItemSelected"
        override fun getEventData() = payload
    }
}
