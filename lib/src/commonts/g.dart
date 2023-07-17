import 'dart:async';
import 'dart:convert';

import 'package:basic_utils/basic_utils.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;
import 'package:flutter/foundation.dart';

import '../constances/database_key.dart';

class JSBridge {
  static final JSBridge _instance = JSBridge._init();
  static JSBridge get instance => _instance;
  late StreamSubscription _streamSubscription;
  final Map<String, dynamic> _responseDataLake = {};

  JSBridge._init() {
    _streamSubscription = html.window.onMessage.listen((onData) {
      final receivedData = onData.data;
      _responseDataLake[receivedData[JSKey.commandId]] =
          receivedData[JSKey.dataKey];
    });
  }

  void _executeCommand(List<dynamic> values) {
    js.context.callMethod(JSConstants.executeCommandMethod, values);
  }

  Future<String?> _receivedResponse(ResponseOptions options) async {
    bool isTimeout = false;
    String? res;
    if (options.receivedTimeout != null) {
      Timer.periodic(Duration(milliseconds: options.receivedTimeout!), (timer) {
        if (res == null) {
          isTimeout = true;
          timer.cancel();
        }
      });
    }

    /// Event loop
    while (!isTimeout) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (_responseDataLake.containsKey(options.commandId)) {
        res = _responseDataLake[options.commandId];
        _responseDataLake.remove(options.commandId);
        return res;
      }
    }
    return null;
  }

  Future<dynamic> sendRequest(List<dynamic> params,
      {int? receivedTimeOut}) async {
    _responseDataLake.clear();
    _executeCommand(params);
    final response = await compute(_receivedResponse,
        ResponseOptions(params.first, receivedTimeout: receivedTimeOut));
    if (StringUtils.isNotNullOrEmpty(response)) {
      return jsonDecode(response!);
    }
    return null;
  }

  void dispose() {
    _streamSubscription.cancel();
    _responseDataLake.clear();
  }
}

enum ImageSource { camera, gallery, cameraDocument, faceDetection }

class ResponseOptions {
  String commandId;
  int? receivedTimeout;
  ResponseOptions(this.commandId, {this.receivedTimeout});
}
