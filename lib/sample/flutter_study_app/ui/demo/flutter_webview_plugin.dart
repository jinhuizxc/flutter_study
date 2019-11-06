import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/*
 * WebViewPlugin
 */
class WebViewPluginPage extends StatefulWidget {
  final String url; // web地址
  final String title; // 标题

  WebViewPluginPage({this.url, this.title = '详情'});

  @override
  _WebViewPluginPageState createState() => _WebViewPluginPageState();
}

class _WebViewPluginPageState extends State<WebViewPluginPage> {
  final FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    print("webUrl == ${widget.url}");

    flutterWebviewPlugin.close();
    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {});
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state){});
    _onHttpError = flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error){
      print(error);
    });
  }

  @override
  void dispose() {
    _onHttpError.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: WebviewScaffold(
        url: widget.url,
        withJavascript: true,
        withZoom: false,
        hidden: true,
        initialChild: Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
