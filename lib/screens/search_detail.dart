import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publicis_demo/widgets/image_view.dart';
import '../models/models.dart';
import '../controllers/controller.dart';
import '../widgets/appbar.dart';

class SearchDetailView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    final _map =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final _searchModel = SearchModel.fromJson(_map['detail']);
    final _image = _searchModel.image
        .firstWhere((element) => element.size == 'extralarge');
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: PublicisAppBar(
        title: 'Detail',
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageView(url: _image.text),
            SizedBox(height: 20),
            Text(
              _searchModel.name,
              textAlign: TextAlign.center,
              style: _theme.textTheme.headline6,
            ),
            SizedBox(height: 10),
            Text(
              _searchModel.artist,
              style: _theme.textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
