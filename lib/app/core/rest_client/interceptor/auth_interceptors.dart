import 'package:dio/dio.dart';
import 'package:homemade_app/app/core/global/global_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final accessToken = prefs.getString('accessToken');
    options.headers['Authorization'] = 'Bearer $accessToken';

    handler.next(options);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      GlobalContext.i.loginExpire();
    } else {
      handler.next(err);
    }
  }
}
