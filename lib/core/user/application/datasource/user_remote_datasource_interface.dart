import '../../../utils/result.dart';

class UserRemoteDataSourceInterface {
  Future<Result> login(String email, String password) async {
    throw UnimplementedError();
  }

  Future<Result> signUp(String name, String lastName, String email, String password) async {
    throw UnimplementedError();
  }
}
