import 'package:it_expert/core/user/application/datasource/user_local_datasource_interface.dart';
import 'package:it_expert/core/user/domain/dto/user_dto.dart';

import '../../../utils/result.dart';

class GetAuthTokenLocalUseCase {
  final UserLocalDataSourceInterface userLocalDataSourceInterface;

  GetAuthTokenLocalUseCase(this.userLocalDataSourceInterface);

  Future<Result> call() async {
    var userInfo = await userLocalDataSourceInterface.getUserInfo();
    if (userInfo.getOrNull() is UserDto) {
      return Result.success(userInfo.getOrNull().token);
    }
    return userInfo;
  }
}
