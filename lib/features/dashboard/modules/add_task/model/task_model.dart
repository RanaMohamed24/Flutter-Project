class TaskModel {
  final String? docId;
  final String title;
  final String? note;
  final String date;
  final String? startTime;
  final String? endTime;
  final String? categoryId;

  TaskModel({
    this.docId,
    required this.title,
    this.note,
    required this.date,
    this.startTime,
    this.endTime,
    required this.categoryId,
  });

  TaskModel.fromJson(Map map)
      : docId = map['docId']?.toString(),
        title = map['title']!,
        note = map['note'],
        date = map['date']!,
        startTime = map['startTime'],
        endTime = map['endTime'],
        categoryId = map['categoryId'];
}
