import 'package:get/get.dart';

import 'core/login/application/is_user_first_time_usecase.dart';
import 'core/login/di.dart';

class MainController extends GetxController {
  final IsUserFirstTimeUseCase _isUserFirstTimeUseCase =
      constructIsUserFirstTimeUseCase();
}
