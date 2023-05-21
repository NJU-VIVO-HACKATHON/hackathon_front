import 'package:hackathon_front/storage/abstract/index.dart';
import 'package:hackathon_front/storage/impl/index.dart';

import 'base.dart';

abstract class StorageProvider {
  UserStorageBase get user;
}

class StorageProviderImpl extends StorageImplBase implements StorageProvider {
  StorageProviderImpl({
    required super.prefs,
  }) : super(
          parentNamespace: '/',
          namespace: 'hackathon',
        );

  @override
  UserStorageBase get user => UserStorageImpl(
        parentNamespace: fullNamespace,
        prefs: prefs,
      );
}
