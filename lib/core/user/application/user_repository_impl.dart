import 'package:it_expert/core/user/application/datasource/user_local_datasource_interface.dart';

import 'package:it_expert/core/user/domain/dto/user_dto.dart';
import 'package:it_expert/core/user/domain/user_repository_interface.dart';
import 'package:it_expert/core/utils/result.dart';

import 'datasource/user_remote_datasource_interface.dart';

class UserRepositoryImpl implements UserRepositoryInterface {
  final UserRemoteDataSourceInterface userRemoteDataSource;
  final UserLocalDataSourceInterface userLocalDataSourceInterface;

  UserRepositoryImpl(
      this.userRemoteDataSource, this.userLocalDataSourceInterface);

  @override
  Future<Result> login(String email, String password) async {
    return userRemoteDataSource.login(email, password);
  }

  @override
  Future<Result> saveUserInfoInLocalStorage(UserDto userDto) async {
    return userLocalDataSourceInterface.saveUserInfo(userDto);
  }

  @override
  Future<Result> getUserInfo() {
    return userLocalDataSourceInterface.getUserInfo();
  }

  Future<Result> signUp(
      String name, String lastName, String email, String password) {
    return userRemoteDataSource.signUp(name, lastName, email, password);
  }

  @override
  Future<Result> getUserInfoInLocalStorage() {
    return userLocalDataSourceInterface.getUserInfo();
  }

  @override
  Future<Result> logout() {
    return userLocalDataSourceInterface.logout();
  }

  @override
  Future<Result> fetchUserStats(String id) {
    return userRemoteDataSource.fetchUserStats(id);
  }

  @override
  Future<Result> changePassword(String email, String pin, String newPassword) {
    return userRemoteDataSource.changePassword(email, pin, newPassword);
  }

  @override
  Future<Result> requestRecoveryPin(String email) {
    return userRemoteDataSource.requestRecoveryPin(email);
  }

}
