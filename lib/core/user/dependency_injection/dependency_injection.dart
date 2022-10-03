import 'package:it_expert/core/user/application/usecase/login_usecase.dart';
import 'package:it_expert/core/user/application/repository/user_repository_impl.dart';
import 'package:it_expert/core/user/infrastructure/datasource/user_remote_datasource_impl.dart';

LoginUseCase constructLoginUseCase() {
  return LoginUseCase(UserRepositoryImpl(UserRemoteDataSourceImpl()));
}
