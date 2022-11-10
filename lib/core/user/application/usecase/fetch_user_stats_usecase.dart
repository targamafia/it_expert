import 'package:it_expert/core/utils/result.dart';

import '../../domain/user_repository_interface.dart';

class FetchUserStatsUsecase {
  final UserRepositoryInterface statsRepository;

  FetchUserStatsUsecase(this.statsRepository);

  Future<Result> call(String id) async {
    var result = await statsRepository.fetchUserStats(id);
    return result;
  }
}