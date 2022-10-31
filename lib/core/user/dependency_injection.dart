import 'package:it_expert/core/user/application/usecase/get_auth_token_local_usecase.dart';
import 'package:it_expert/core/user/application/usecase/login_usecase.dart';
import 'package:it_expert/core/user/application/user_repository_impl.dart';
import 'package:it_expert/core/user/infrastructure/user_local_datasource_impl.dart';
import 'package:it_expert/core/user/infrastructure/user_remote_datasource_impl.dart';

LoginUseCase constructLoginUseCase() {
  return LoginUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

GetAuthTokenLocalUseCase constructGetAuthTokenLocalUseCase() {
  return GetAuthTokenLocalUseCase(UserLocalDataSourceImpl());
}
