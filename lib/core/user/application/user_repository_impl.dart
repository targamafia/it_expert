import 'package:it_expert/core/user/domain/dto/login_dto.dart';
import 'package:it_expert/core/user/domain/user_repository_interface.dart';
import 'package:it_expert/core/utils/result.dart';

import 'user_remote_datasource_interface.dart';

class UserRepositoryImpl implements UserRepositoryInterface {
  final UserRemoteDataSourceInterface userRemoteDataSource;

  UserRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<Result> login(String email, String password) {
    return userRemoteDataSource.login(email, password);
  }
}
