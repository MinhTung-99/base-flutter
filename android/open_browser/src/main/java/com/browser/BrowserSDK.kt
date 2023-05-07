package com.browser

import android.content.Context
import android.content.Intent
import android.net.Uri

class BrowserSDK {

    fun openBrowser(url: String, context: Context) {
        val browserIntent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        context.startActivity(browserIntent)
    }

    class Builder {

        var browserSDK: BrowserSDK = BrowserSDK()

        fun openBrowser(url: String, context: Context) {
            browserSDK.openBrowser(url, context)
        }

    }
}