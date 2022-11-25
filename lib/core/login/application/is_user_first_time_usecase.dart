import '../../utils/result.dart';

class IsUserFirstTimeUseCase {
  Future<Result> call() {
    return Future.delayed(
        const Duration(seconds: 1), () => Result.success(false));
  }
}
