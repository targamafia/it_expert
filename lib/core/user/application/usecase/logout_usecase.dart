import 'package:it_expert/core/utils/result.dart';

import '../../domain/user_repository_interface.dart';

class LogOutUseCase {
  final UserRepositoryInterface logOutRepository;

  LogOutUseCase(this.logOutRepository);

  Future<Result> call()  {
    return logOutRepository.logout();
  }
}
