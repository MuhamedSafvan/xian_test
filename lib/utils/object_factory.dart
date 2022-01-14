import 'api_client.dart';

class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  ApiClient _apiClient = ApiClient();

  ApiClient get apiClient => _apiClient;

}
