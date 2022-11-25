import 'package:it_expert/core/utils/result.dart';
import 'package:it_expert/core/user/domain/user_repository_interface.dart';

class ChangePasswordUseCase {

  final UserRepositoryInterface changePasswordRepository;

  ChangePasswordUseCase(this.changePasswordRepository);

  Future<Result> call(String email, String pin, String newPassword) async {
    var result = await changePasswordRepository.changePassword(email, pin, newPassword);
    return result;
  }
}