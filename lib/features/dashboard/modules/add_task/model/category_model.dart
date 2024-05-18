class CategoryModel {
  final String? docId;
  final String name;

  CategoryModel({
    this.docId,
    required this.name,
  });

  CategoryModel.fromJson(Map map)
      : docId = map['docId'].toString(),
        name = map['name'];
}
