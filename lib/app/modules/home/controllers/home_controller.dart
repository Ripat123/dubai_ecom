import 'package:dubai_ecocm/app/modules/market/controllers/market_controller.dart';
import 'package:get/get.dart';

import '../../account/controllers/account_controller.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../order/controllers/order_controller.dart';


class HomeController extends GetxController {

  var currentIndex = 0.obs;

  void changePage(int index) {
    currentIndex.value = index;

    // Lazy load controllers based on index
    switch (index) {
      case 0:
        if (!Get.isRegistered<DashboardController>()) {
          Get.lazyPut<DashboardController>(() => DashboardController());
        }
        break;
      case 1:
        if (!Get.isRegistered<OrderController>()) {
          Get.lazyPut<OrderController>(() => OrderController());
        }
        break;
      case 2:
        if (!Get.isRegistered<MarketController>()) {
          Get.lazyPut<MarketController>(() => MarketController());
        }
        break;
      case 3:
        if (!Get.isRegistered<AccountController>()) {
          Get.lazyPut<AccountController>(() => AccountController());
        }
        break;
    }
  }

  @override
  void onInit() {
    super.onInit();
    changePage(0);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
