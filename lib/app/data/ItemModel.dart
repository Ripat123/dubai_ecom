

class ItemModel {
  int id;
  String imgUrl;
  String title;

//<editor-fold desc="Data Methods">

  ItemModel({
    required this.id,
    required this.imgUrl,
    required this.title,
  });


  @override
  String toString() {
    return 'ItemModel{' +
        ' id: $id,' +
        ' imgUrl: $imgUrl,' +
        ' title: $title,' +
        '}';
  }


  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'imgUrl': this.imgUrl,
      'title': this.title,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] as int,
      imgUrl: map['imgUrl'] as String,
      title: map['title'] as String,
    );
  }

}