import 'package:basic_utils/basic_utils.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'command_dender.dart';
import 'exception_handle.dart';
import 'logger_utils.dart';
import 'mini_app_mem_cache.dart';
import 'rest_utils.dart';

class LoggingInterceptor extends Interceptor {
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    LoggerUtils.d('----------Start----------');
    if (options.queryParameters.isEmpty) {
      LoggerUtils.d('RequestUrl: ${options.baseUrl}${options.path}');
    } else {
      LoggerUtils.d(
          'RequestUrl: ${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}');
    }
    LoggerUtils.d('RequestMethod: ${options.method}');
    LoggerUtils.d('RequestHeaders:${options.headers}');
    LoggerUtils.d('RequestContentType: ${options.contentType}');
    LoggerUtils.d('RequestData: ${options.data.toString()}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    if (response.statusCode == ExceptionHandle.success) {
      LoggerUtils.d('ResponseCode: ${response.statusCode}');
    } else {
      LoggerUtils.e('ResponseCode: ${response.statusCode}');
    }
    LoggerUtils.d('ResponseData: ${response.data.toString()}');
    LoggerUtils.d('----------End: $duration millisecond----------');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    LoggerUtils.e('Error: ${err.message}');
    super.onError(err, handler);
  }
}

class DefaultHeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['User-Agent'] = 'AIA/2022';
    super.onRequest(options, handler);
  }
}

class MiniAppTokenInterceptor extends QueuedInterceptor {
  final String _mainInstanceName;

  MiniAppTokenInterceptor(this._mainInstanceName);

  Future<Map<String, dynamic>?> _getToken() async {
    return CommandSender.getToken(isNewestToken: true);
  }

  @override
  Future<void> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    //401
    if (response.statusCode == ExceptionHandle.unauthorized) {
      LoggerUtils.d('-----------Request New Token------------');
      final RestUtils restUtils =
          GetIt.I.get<RestUtils>(instanceName: _mainInstanceName);
      await _getToken();

      if (StringUtils.isNotNullOrEmpty(MiniAppMemCache.jwtToken)) {
        final Dio dio = Dio();
        dio.options = restUtils.dio.options;
        final RequestOptions request = response.requestOptions;
        request.headers['Authorization'] = 'Bearer ${MiniAppMemCache.jwtToken}';

        final Options options = Options(
          headers: request.headers,
          method: request.method,
        );

        try {
          LoggerUtils.d('----------- Re-Request API ------------');
          final Response<dynamic> response = await dio.request<dynamic>(
            request.path,
            data: request.data,
            queryParameters: request.queryParameters,
            cancelToken: request.cancelToken,
            options: options,
            onReceiveProgress: request.onReceiveProgress,
          );
          return handler.next(response);
        } on DioException catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onResponse(response, handler);
  }
}
