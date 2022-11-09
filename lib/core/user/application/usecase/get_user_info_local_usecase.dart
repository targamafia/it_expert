import 'package:it_expert/core/user/domain/user_repository_interface.dart';
import 'package:it_expert/core/utils/result.dart';

class GetUserInfoLocalUseCase {
  final UserRepositoryInterface userRepositoryInterface;

  GetUserInfoLocalUseCase(this.userRepositoryInterface);

  Future<Result> call() {
    return userRepositoryInterface.getUserInfoInLocalStorage();
  }
}
