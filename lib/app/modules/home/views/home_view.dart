import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../controllers/home_controller.dart';
import 'package:dubai_ecocm/app/modules/account/views/account_view.dart';
import 'package:dubai_ecocm/app/modules/cart/views/cart_view.dart';
import 'package:dubai_ecocm/app/modules/dashboard/views/dashboard_view.dart';
import 'package:dubai_ecocm/app/modules/order/views/order_view.dart';
import 'package:dubai_ecocm/app/navController/navigation_controller.dart';


class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize NavigationController (consider moving to onInit or main)
    final NavigationController navigationController = Get.find<NavigationController>();
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      body: Obx(() => IndexedStack(
        index: navigationController.currentIndex.value,
        children: [
          const DashboardView(),
          const OrderView(),
          const CartView(),
          const AccountView(),
        ],
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        elevation: 5,
        currentIndex: navigationController.currentIndex.value,
        onTap: navigationController.changePage,
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
            label: 'Cart',
            tooltip: 'Cart Tab', // Add semantic label
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