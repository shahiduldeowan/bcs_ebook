import 'dart:convert';

class HomeCarouselModel {
  final String imgSrc;
  final String title;

  HomeCarouselModel({
    required this.imgSrc,
    required this.title,
  });

  HomeCarouselModel copyWith({
    String? imgSrc,
    String? title,
  }) {
    return HomeCarouselModel(
      imgSrc: imgSrc ?? this.imgSrc,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imgSrc': imgSrc,
      'title': title,
    };
  }

  factory HomeCarouselModel.fromMap(Map<String, dynamic> map) {
    return HomeCarouselModel(
      imgSrc: map['imgSrc'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeCarouselModel.fromJson(String source) =>
      HomeCarouselModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HomeCarouselModel(imgSrc: $imgSrc, title: $title)';

  @override
  bool operator ==(covariant HomeCarouselModel other) {
    if (identical(this, other)) return true;

    return other.imgSrc == imgSrc && other.title == title;
  }

  @override
  int get hashCode => imgSrc.hashCode ^ title.hashCode;
}
