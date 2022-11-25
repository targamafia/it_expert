import 'package:it_expert/core/user/application/usecase/fetch_user_stats_usecase.dart';
import 'package:it_expert/core/user/application/usecase/get_auth_token_local_usecase.dart';
import 'package:it_expert/core/user/application/usecase/get_user_info_local_usecase.dart';
import 'package:it_expert/core/user/application/usecase/get_profile_data_usecase.dart';
import 'package:it_expert/core/user/application/usecase/login_usecase.dart';
import 'package:it_expert/core/user/application/usecase/logout_usecase.dart';
import 'package:it_expert/core/user/application/usecase/sign_up_usecase.dart';
import 'package:it_expert/core/user/application/user_repository_impl.dart';
import 'package:it_expert/core/user/infrastructure/user_local_datasource_impl.dart';
import 'package:it_expert/core/user/infrastructure/user_remote_datasource_impl.dart';

import 'application/usecase/change_password_usecase.dart';
import 'application/usecase/request_recovery_pin_usecase.dart';

LoginUseCase constructLoginUseCase() {
  return LoginUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

GetAuthTokenLocalUseCase constructGetAuthTokenLocalUseCase() {
  return GetAuthTokenLocalUseCase(UserLocalDataSourceImpl());
}

GetProfileDataUseCase constructProfileDataUseCase() {
  return GetProfileDataUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

SignUpUseCase constructSignUpUseCase() {
  return SignUpUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

GetUserInfoLocalUseCase constructGetUserInfoLocalUseCase() {
  return GetUserInfoLocalUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

LogOutUseCase constructLogOutUseCase() {
  return LogOutUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

FetchUserStatsUsecase constructUserStatsUseCase() {
  return FetchUserStatsUsecase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

ChangePasswordUseCase constructChangePasswordUseCase() {
  return ChangePasswordUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}

RequestRecoveryPinUseCase constructRequestRecoveryPin() {
  return RequestRecoveryPinUseCase(UserRepositoryImpl(
      UserRemoteDataSourceImpl(), UserLocalDataSourceImpl()));
}
