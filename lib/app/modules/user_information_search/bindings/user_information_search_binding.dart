import 'package:get/get.dart';

import '../controllers/user_information_search_controller.dart';

class UserInformationSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserInformationSearchController>(
      () => UserInformationSearchController(),
    );
  }
}
