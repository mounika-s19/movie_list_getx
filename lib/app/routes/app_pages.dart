import 'package:get/get.dart';
import 'package:getx_api_sample/app/modules/home/view/animation_view.dart';

import '../modules/home/binding/home_binding.dart';
import '../modules/home/view/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.animationView;

  static final routes = [
    GetPage(
      name: _Paths.animationView,
      page: () => const AnimationView(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
