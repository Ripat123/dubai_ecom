

class ItemModel {
  String imgUrl;
  String title;

//<editor-fold desc="Data Methods">
  ItemModel({
    required this.imgUrl,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemModel &&
          runtimeType == other.runtimeType &&
          imgUrl == other.imgUrl &&
          title == other.title);

  @override
  String toString() {
    return 'ItemModel{' + ' imgUrl: $imgUrl,' + ' title: $title,' + '}';
  }

  Map<String, dynamic> toMap() {
    return {
      'imgUrl': this.imgUrl,
      'title': this.title,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      imgUrl: map['imgUrl'] as String,
      title: map['title'] as String,
    );
  }

//</editor-fold>
}