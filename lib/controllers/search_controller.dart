import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/models.dart';
import '../repository/repository.dart';

class SearchController extends GetxController {
  SearchController({required this.searchRepository});

  final ISearchRepository searchRepository;

  RxList<SearchModel> searchModels = RxList.empty();
  var isLoading = false.obs;

  void searchAlbums(String query) {
    isLoading.value = true;
    searchModels.value = [];
    searchRepository
        .fetchSearchResults(query)
        .then((value) => searchModels.value = value)
        .catchError(
      (error) {
        Get.snackbar(
          'Error!!',
          error.toString(),
          backgroundColor: Colors.black,
          colorText: Colors.white,
        );
      },
    ).whenComplete(() => isLoading.value = false);
  }

  @override
  void onClose() {
    super.onClose();
    searchModels.clear();
  }
}
