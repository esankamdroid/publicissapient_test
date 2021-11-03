import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../repository/repository.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ISearchRepository>(() => SearchRepository());
    Get.lazyPut(() => SearchController(searchRepository: Get.find()));
  }
}
