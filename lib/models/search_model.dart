class SearchModel {
  String name;
  String artist;
  String url;
  List<Image> image;

  SearchModel({
    required this.name,
    required this.artist,
    required this.url,
    required this.image,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        name: json['name'],
        artist: json['artist'],
        url: json['url'],
        image: json['image'] != null
            ? (json['image'] as List<dynamic>)
                .map((v) => Image.fromJson(v))
                .toList()
            : [],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['artist'] = this.artist;
    data['url'] = this.url;
    data['image'] = this.image.map((v) => v.toJson()).toList();
    return data;
  }
}

class Image {
  String text;
  String size;

  Image({required this.text, required this.size});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        text: json['#text'],
        size: json['size'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['#text'] = this.text;
    data['size'] = this.size;
    return data;
  }
}
