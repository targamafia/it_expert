import 'package:it_expert/core/utils/result.dart';
import 'package:it_expert/core/user/domain/user_repository_interface.dart';

class RequestRecoveryPinUseCase {

  final UserRepositoryInterface requestRecoveryPin;

  RequestRecoveryPinUseCase(this.requestRecoveryPin);

  Future<Result> call(String email) async {
    var result = await requestRecoveryPin.requestRecoveryPin(email);
    return result;
  }
}