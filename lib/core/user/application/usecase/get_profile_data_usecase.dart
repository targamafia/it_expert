import 'package:it_expert/core/utils/result.dart';

import '../../domain/user_repository_interface.dart';

class GetProfileDataUseCase {

  final UserRepositoryInterface profileRepository;

  GetProfileDataUseCase(this.profileRepository);

  Future<Result> call() async{
    var result =  await profileRepository.getUserInfo();
    return result;
  }

}