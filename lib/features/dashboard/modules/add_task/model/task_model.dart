class TaskModel {
  final String? docId;
  final String title;
  final String? note;
  final String date;
  final String? startTime;
  final String? endTime;
  final String? categoryId;
  bool isChecked;

  TaskModel({
    this.docId,
    required this.title,
    this.note,
    required this.date,
    this.startTime,
    this.endTime,
    required this.categoryId,
    this.isChecked = false,
  });
  TaskModel copyWith({
    String? docId,
    String? title,
    String? note,
    String? date,
    String? startTime,
    String? endTime,
    String? categoryId,
    bool? isChecked,
  }) {
    return TaskModel(
      docId: docId ?? this.docId,
      title: title ?? this.title,
      note: note ?? this.note,
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      categoryId: categoryId ?? this.categoryId,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  TaskModel.fromJson(Map map)
      : docId = map['docId']?.toString(),
        title = map['title']!,
        note = map['note'],
        date = map['date']!,
        startTime = map['startTime'],
        endTime = map['endTime'],
        categoryId = map['categoryId'],
        isChecked = map['isChecked'] ?? false;
}
