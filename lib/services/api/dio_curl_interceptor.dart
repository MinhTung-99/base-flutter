import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, Response, MultipartFile;

class DioCurlInterceptor extends InterceptorsWrapper {
  //final _logger = Get.find<SlackLogger>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // try {
    //   log('------ BEGIN REQUEST ------');
    //   log(options.toCurlCmd());
    //   log('------ END REQUEST ------');
    // } catch (e) {
    //   log('Create CURL failure!! - $e');
    // }
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;
    _prettyPrintJson(data, response.requestOptions);
    // log(response.toString());
    return handler.next(response);
  }

  void _prettyPrintJson(Object response, RequestOptions options) {
    try {
      log('------ BEGIN REQUEST ------');
      log(options.toCurlCmd());
      log('------ END REQUEST ------');
      //log(response.toString());
      log('------ RESPONSE REQUEST ------');
    } catch (e) {
      log('Create CURL failure!! - $e');
    }
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final message =
        '------ BEGIN REQUEST ------\n${err.requestOptions.toCurlCmd()}\nResult: ${err.response.toString()}\n------ END REQUEST ------ \n\n\n\n\n\n\n\n';
   // _logger.logging(message);
    super.onError(err, handler);
  }
}

extension Curl on RequestOptions {
  String toCurlCmd() {
    String cmd = 'curl';

    // ignore: unnecessary_this
    final String header = this
        .headers
        .map((key, value) {
          if (key == 'content-type' &&
              value.toString().contains('multipart/form-data')) {
            value = 'multipart/form-data;';
          }
          return MapEntry(key, "--header '$key: $value'");
        })
        .values
        .join(' ');
    String url = '$baseUrl$path';
    if (queryParameters.isNotEmpty) {
      final String query = queryParameters
          .map((key, value) {
            return MapEntry(key, '$key=$value');
          })
          .values
          .join('&');

      url += (url.contains('?')) ? query : '?$query';
    }
    if (method == 'GET') {
      cmd += " $header '$url'";
    } else {
      final Map<String, dynamic> files = {};
      String postData = "-d ''";
      if (data != null) {
        if (data is FormData) {
          final FormData fdata = data;
          for (var element in fdata.files) {
            final MultipartFile file = element.value;
            files[element.key] = '@${file.filename}';
          }
          for (var element in fdata.fields) {
            files[element.key] = element.value;
          }
          if (files.isNotEmpty) {
            postData = files
                .map((key, value) => MapEntry(key, "--form '$key=\"$value\"'"))
                .values
                .join(' ');
          }
        } else if (data is Map<String, dynamic>) {
          files.addAll(data);

          if (files.isNotEmpty) {
            postData = "-d '${json.encode(files).toString()}'";
          }
        }else{
          postData = "-d '${data.toString()}'";
        }
      }

      final String method = this.method.toString();
      cmd += " --location '$url' -X $method $header $postData";
    }

    return cmd;
  }
}
