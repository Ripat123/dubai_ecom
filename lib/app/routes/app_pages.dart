import 'package:get/get.dart';

import '../modules/account/bindings/account_binding.dart';
import '../modules/account/views/account_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/food_detail_bottom_sheet/bindings/food_detail_bottom_sheet_binding.dart';
import '../modules/food_detail_bottom_sheet/views/food_detail_bottom_sheet_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/item_view/bindings/item_view_binding.dart';
import '../modules/item_view/views/item_view_view.dart';
import '../modules/location_selection/bindings/location_selection_binding.dart';
import '../modules/location_selection/views/location_selection_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/order/bindings/order_binding.dart';
import '../modules/order/views/order_view.dart';
import '../modules/restraunt_view/bindings/restraunt_view_binding.dart';
import '../modules/restraunt_view/views/restraunt_view_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => const AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESTRAUNT_VIEW,
      page: () => const RestrauntViewView(),
      binding: RestrauntViewBinding(),
    ),
    GetPage(
      name: _Paths.ITEM_VIEW,
      page: () => const ItemViewView(),
      binding: ItemViewBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.LOCATION_SELECTION,
      page: () => const LocationSelectionView(),
      binding: LocationSelectionBinding(),
    ),
    GetPage(
      name: _Paths.FOOD_DETAIL_BOTTOM_SHEET,
      page: () => FoodDetailBottomSheetView(),
      binding: FoodDetailBottomSheetBinding(),
    ),
  ];
}
