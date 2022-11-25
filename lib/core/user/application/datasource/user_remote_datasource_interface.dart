import '../../../utils/result.dart';

class UserRemoteDataSourceInterface {
  Future<Result> login(String email, String password) async {
    throw UnimplementedError();
  }

  Future<Result> signUp(String name, String lastName, String email, String password) async {
    throw UnimplementedError();
  }

  Future<Result> fetchUserStats(String id) async {
    throw UnimplementedError();
  }

  Future<Result> changePassword(String email, String pin, String newPassword)  async {
    throw UnimplementedError();
  }

  Future<Result> requestRecoveryPin(String email) async {
    throw UnimplementedError();
  }
}
