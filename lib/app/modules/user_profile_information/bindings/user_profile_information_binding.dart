import 'package:get/get.dart';

import '../controllers/user_profile_information_controller.dart';

class UserProfileInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProfileInformationController>(
      () => UserProfileInformationController(),
    );
  }
}
