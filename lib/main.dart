import 'package:disposebag/disposebag.dart';
import 'package:flutter/foundation.dart'
    show debugPrint, debugPrintSynchronously, kReleaseMode;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_pattern/flutter_bloc_pattern.dart';
import 'package:flutter_provider/flutter_provider.dart';
import 'package:majooapp/app.dart';
import 'package:majooapp/data/local/local_data_source.dart';
import 'package:majooapp/data/local/shared_pref_util.dart';
import 'package:majooapp/data/remote/api_service.dart';
import 'package:majooapp/data/remote/remote_data_source.dart';
import 'package:majooapp/data/user_repository_imp.dart';
import 'package:majooapp/domain/repositories/user_repository.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RxStreamBuilder.checkStateStreamEnabled = !kReleaseMode;
  _setupLoggers();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // construct RemoteDataSource
  const RemoteDataSource remoteDataSource = ApiService();

  // construct LocalDataSource
  final rxPrefs = RxSharedPreferences.getInstance();
  final LocalDataSource localDataSource = SharedPrefUtil(rxPrefs);

  // construct UserRepository
  final UserRepository userRepository = UserRepositoryImpl(
    remoteDataSource,
    localDataSource,
  );

  runApp(
    Provider<UserRepository>.value(
      userRepository,
      child: const MyApp(),
    ),
  );
}

void _setupLoggers() {
  // set loggers to `null` to disable logging.
  DisposeBagConfigs.logger = kReleaseMode ? null : disposeBagDefaultLogger;

  RxSharedPreferencesConfigs.logger =
      kReleaseMode ? null : const RxSharedPreferencesDefaultLogger();

  debugPrint = kReleaseMode
      ? (String? message, {int? wrapWidth}) {}
      : debugPrintSynchronously;
}
