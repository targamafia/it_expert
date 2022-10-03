import 'package:it_expert/core/user/application/login_usecase.dart';
import 'package:it_expert/core/user/application/user_repository_impl.dart';
import 'package:it_expert/core/user/infrastructure/user_remote_datasource_impl.dart';

LoginUseCase constructLoginUseCase() {
  return LoginUseCase(UserRepositoryImpl(UserRemoteDataSourceImpl()));
}
