package com.develop.coronastatus;

import android.os.Bundle;
import android.net.Uri;
import android.content.Intent;
import android.app.Activity;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL ="flutterapp.tutorialspoint.com/browser";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);clear

        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
        new MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall call, Result result) {
                String url = call.argument("url");
                if (call.method.equals("openBrowser")) {
                    openBrowser(call, result, url);
                } else {
                    result.notImplemented();
                }
            }
        });
    }
    private void openBrowser(MethodCall call, Result result, String url) {
        Activity activity = this;
        if (activity == null) {
            result.error("ACTIVITY_NOT_AVAILABLE", "Browser cannot be opened
                    without foreground activity", null);
                    return;
        }
        Intent intent = new Intent(Intent.ACTION_VIEW);
        intent.setData(Uri.parse(url));
        activity.startActivity(intent);
        result.success((Object) true);
    }
}