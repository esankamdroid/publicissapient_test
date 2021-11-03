import 'package:get/get.dart';
import '../bindings/binding.dart';
import '../screens/screens.dart';
part 'routes.dart';

class Pages {
  static const INITIAL = Routes.SEARCH;
  static final routes = [
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: Routes.SEARCH_DETAIL,
      page: () => SearchDetailView(),
    )
  ];
}
