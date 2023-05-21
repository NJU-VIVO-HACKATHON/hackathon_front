import 'package:hackathon_front/storage/abstract/index.dart';
import 'package:hackathon_front/storage/impl/index.dart';
import 'package:hackathon_front/util/kv_storage.dart';

abstract class StorageProvider {
  UserStorageBase get user;
}

class StorageProviderImpl implements StorageProvider {
  final KvStorage kv;

  StorageProviderImpl(this.kv);

  @override
  UserStorageBase get user => UserStorageImpl(
        KvStorageWithNamespace(
          source: kv,
          namespace: 'user',
        ),
      );
}
