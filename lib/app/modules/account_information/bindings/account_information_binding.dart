import 'package:get/get.dart';

import '../controllers/account_information_controller.dart';

class AccountInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountInformationController>(
      () => AccountInformationController(),
    );
  }
}
