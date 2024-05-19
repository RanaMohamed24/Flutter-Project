class CategoryModel {
  final String docId;
  final String name;

  CategoryModel({
    required this.docId,
    required this.name,
  });

  CategoryModel copyWith({
    String? docId,
    String? name,
  }) {
    return CategoryModel(
      docId: docId ?? this.docId,
      name: name ?? this.name,
    );
  }
}