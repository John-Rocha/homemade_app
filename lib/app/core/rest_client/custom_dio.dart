import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:homemade_app/app/core/config/env/env.dart';
import 'package:homemade_app/app/core/rest_client/interceptor/auth_interceptors.dart';

late AuthInterceptors _authInterceptors;

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backend_base_url'] ?? '',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptors = AuthInterceptors();
  }

  CustomDio auth() {
    interceptors.add(_authInterceptors);
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptors);
    return this;
  }
}
