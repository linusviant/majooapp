import 'dart:convert';

import 'package:majooapp/data/exception/local_data_source_exception.dart';
import 'package:majooapp/data/local/entities/user_and_token_entity.dart';
import 'package:majooapp/data/local/local_data_source.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class SharedPrefUtil implements LocalDataSource {
  static const _kUserTokenKey = 'com.hoc.majooapp_flutter.user_and_token';
  final RxSharedPreferences _rxPrefs;

  const SharedPrefUtil(this._rxPrefs);

  @override
  Future<void> removeUserAndToken() =>
      _rxPrefs.remove(_kUserTokenKey).onError<Object>((e, s) =>
          throw LocalDataSourceException('tidak menghapus user dan token', e, s));

  @override
  Future<void> saveUserAndToken(UserAndTokenEntity userAndToken) {
    return _rxPrefs
        .write<UserAndTokenEntity>(_kUserTokenKey, userAndToken, _toString)
        .onError<Object>((e, s) =>
            throw LocalDataSourceException('Tidak Menyimpan user dan token', e, s));
  }

  @override
  Future<UserAndTokenEntity?> get userAndToken => _rxPrefs
      .read<UserAndTokenEntity>(_kUserTokenKey, _toEntity)
      .onError<Object>((e, s) =>
          throw LocalDataSourceException('Tidak Membaca user dan token', e, s));

  @override
  Stream<UserAndTokenEntity?> get userAndToken$ => _rxPrefs
      .observe<UserAndTokenEntity>(_kUserTokenKey, _toEntity)
      .onErrorReturnWith((e, s) =>
          throw LocalDataSourceException('Tidak Membaca user dan token', e, s));

  static UserAndTokenEntity? _toEntity(dynamic jsonString) => jsonString == null
      ? null
      : UserAndTokenEntity.fromJson(json.decode(jsonString));

  static String? _toString(UserAndTokenEntity? entity) =>
      entity == null ? null : jsonEncode(entity);
}
