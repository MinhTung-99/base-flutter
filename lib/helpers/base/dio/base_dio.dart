import 'package:dio/dio.dart';
import '../../../data/local/shared_preferences/shared_preferences.dart';
import '../../../data/network/api/dio_curl_interceptor.dart';
import '../../../injection.dart';

class BaseDio {
  late Dio dio;

  Dio getDio() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {},
      ),
    );

    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      final token = await getIt<SharedPreference>().getToken();
      if (token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
      return handler.next(options);
    },
        // onResponse: (response, handler) {
        //   // DialogCommon.dismiss();
        //   return handler.next(response);
        // },
        onError: (DioError e, handler) {
      print('ERRO_BASE=$e');
      if (e.response?.statusCode == 401) {}
      return handler.next(e);
    }));

    dio.interceptors.add(DioCurlInterceptor());

    return dio;
  }
}
