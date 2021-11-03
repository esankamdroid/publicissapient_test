import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publicis_demo/widgets/image_view.dart';
import '../widgets/indicator.dart';
import '../controllers/controller.dart';
import '../routes/pages.dart';
import '../widgets/appbar.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PublicisAppBar(
        title: 'Search',
      ),
      body: Column(
        children: [
          SearchBar(controller),
          Expanded(
            child: Obx(
              () => controller.isLoading.value
                  ? Indicator()
                  : SearchAlbumList(controller),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  final SearchController controller;
  SearchBar(this.controller);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: _searchController,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search Album',
                  border: InputBorder.none,
                ),
                onFieldSubmitted: (value) => _search(value),
              ),
            ),
          ),
          IconButton(
            onPressed: () => _search(_searchController.text),
            icon: Icon(
              Icons.search,
              color: Theme.of(context).accentColor,
            ),
          ),
        ],
      ),
    );
  }

  void _search(String value) {
    print(value);
    if (value.isNotEmpty) {
      FocusManager.instance.primaryFocus?.unfocus();
      controller.searchAlbums(value);
    } else {
      Get.snackbar(
        'Error!!',
        'enter word to search',
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    }
  }
}

class SearchAlbumList extends StatelessWidget {
  final SearchController controller;

  SearchAlbumList(this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () => controller.searchModels.isNotEmpty
            ? ListView.builder(
                itemCount: controller.searchModels.length,
                itemBuilder: (context, index) {
                  final _searchModel = controller.searchModels[index];
                  return ListTile(
                    onTap: () => Get.toNamed(
                      Routes.SEARCH_DETAIL,
                      arguments: {
                        'detail': _searchModel.toJson(),
                      },
                    ),
                    leading: SizedBox(
                      child: ImageView(url: _searchModel.image[1].text),
                      width: 40,
                      height: 40,
                    ),
                    title: Text(_searchModel.name),
                    subtitle: Text(_searchModel.artist),
                  );
                },
              )
            : Center(
                child: Text('No records found.'),
              ),
      ),
    );
  }
}
