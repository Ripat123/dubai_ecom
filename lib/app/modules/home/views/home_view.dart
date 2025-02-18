import 'package:dubai_ecocm/app/modules/market/views/market_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import 'package:dubai_ecocm/app/modules/account/views/account_view.dart';
import 'package:dubai_ecocm/app/modules/dashboard/views/dashboard_view.dart';
import 'package:dubai_ecocm/app/modules/order/views/order_view.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          DashboardView(),
          OrderView(),
          MarketView(),
          AccountView(),
        ],
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        elevation: 5,
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        selectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
            tooltip: 'Home Tab', // Add semantic label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list_rounded),
            label: 'Order',
            tooltip: 'Order Tab', // Add semantic label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
            label: 'Market',
            tooltip: 'Market Tab', // Add semantic label
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Account',
            tooltip: 'Account Tab', // Add semantic label
          ),
        ],
      )),
    );
  }
}