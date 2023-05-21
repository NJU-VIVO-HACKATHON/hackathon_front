import 'global/config.dart';

abstract class BackendProvider {
  String get api;
  String get license;
}

class BackendProviderImpl implements BackendProvider {
  @override
  String get api => GlobalConfig.baseUrl;

  @override
  String get license => '';
}

class BackendProviderMock implements BackendProvider {
  @override
  String get api => 'http://localhost:57890';

  @override
  String get license => '';
}
