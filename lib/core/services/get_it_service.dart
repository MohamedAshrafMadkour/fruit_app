import 'package:fruit_app/core/services/auth_service.dart';
import 'package:fruit_app/core/services/database_service.dart';
import 'package:fruit_app/core/services/firesore_service.dart';
import 'package:fruit_app/features/Auth/data/repo/auth_repo_impl.dart';
import 'package:fruit_app/features/Auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      authService: getIt<AuthService>(),
      databaseService: getIt<DatabaseService>(),
    ),
  );
}
