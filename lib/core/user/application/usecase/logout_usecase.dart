import 'package:it_expert/core/utils/result.dart';

import '../../domain/user_repository_interface.dart';

class LogOutUseCase {
  final UserRepositoryInterface logOutRepository;

  LogOutUseCase(this.logOutRepository);

  Future<Result> call() async {
    var result = await logOutRepository.logout();

    if (result.isSuccess) {
      await logOutRepository.logout();
    }
    return result;
  }
}
