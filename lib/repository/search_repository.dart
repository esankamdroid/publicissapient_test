import 'package:get/get.dart';

import '../constant.dart';
import '../models/models.dart';

abstract class ISearchRepository {
  Future<List<SearchModel>> fetchSearchResults(String searchQuery);
}

class SearchRepository extends GetConnect implements ISearchRepository {
  @override
  void onInit() {
    httpClient.baseUrl = Constant.url;
    super.onInit();
  }

  @override
  Future<List<SearchModel>> fetchSearchResults(String searchQuery) async {
    final response = await get(
      'method=album.search&album=$searchQuery',
      decoder: (data) {
        List<SearchModel> _resultList = [];
        if (data['results'] != null) {
          final _results = data['results'];
          if (_results['albummatches'] != null) {
            final _matches = _results['albummatches'];
            if (_matches['album'] != null) {
              final _albums = _matches['album'] as List<dynamic>;
              _resultList = _albums
                  .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
                  .toList();
            }
          }
        }
        return _resultList;
      },
    );
    if (response.status.hasError) {
      return Future.error(response.bodyString != null
          ? response.bodyString!
          : response.statusText!);
    } else {
      return response.body!;
    }
  }
}
