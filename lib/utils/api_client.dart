import 'package:dio/dio.dart';
import './urls.dart';

class ApiClient {
  late Dio dio;

  ApiClient() {
    dio = Dio(BaseOptions(
      baseUrl: Urls.baseUrl,
      headers: {
        // HttpHeaders.contentTypeHeader: 'application/json',
        // HttpHeaders.acceptHeader: 'application/json',
      },
      connectTimeout: 3000000,
      receiveTimeout: 1000000,
      followRedirects: true,
      responseType: ResponseType.json,
      receiveDataWhenStatusError: true,
      contentType: ResponseType.plain.toString(),
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onError: (e, handler) {
        print(e);
        Response res = _handleDioError(e);
        handler.resolve(res);
      },
    ));
    //print("here it is now");
  }

  Response _handleDioError(DioError dioError) {
    String message;
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectTimeout:
        message = "Connection timeout with API server";
        break;
      case DioErrorType.other:
        message = "Connection to API server failed due to internet connection";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.response:
        switch (dioError.response!.statusCode) {
          case 400:
            message = 'Bad request';
            break;
          case 404:
            message = "404 bad request";
            break;
          case 422:
            message = "422 bad request";
            break;
          case 500:
            message = 'Internal server error';
            break;
          default:
            message = 'Oops something went wrong';
            break;
        }
        break;
      case DioErrorType.sendTimeout:
        message = "Send timeout in connection with API server";
        break;
      default:
        message = "Something went wrong";
        break;
    }
    return Response(
        requestOptions: RequestOptions(path: ""),
        data: dioError.response?.data,
        statusMessage: message,
        statusCode: dioError.response?.statusCode ?? 500);
  }

  Future<Response> registerUser({
    required String name,
    required String job,
  }) {
    FormData formData = FormData.fromMap({
      "name": name,
      "job": job,
    });
    return dio.post(Urls.baseUrl, data: formData);
  }

  Future<Response> getUsers({int? id, int? page}) {
    return dio
        .get(Urls.baseUrl, queryParameters: {'id': id, 'page': page});
  }
}
