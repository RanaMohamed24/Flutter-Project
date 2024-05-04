class TaskModel {
  late String docId;
  String? title;
  String? note;
  String? isCompleted;
  String? date;
  String? startTime;
  String? endTime;

  TaskModel(
      {required this.docId,
      this.title,
      this.note,
      this.isCompleted,
      this.date,
      this.startTime,
      this.endTime});

  TaskModel.fromJson(Map map) {
    docId = map['docId'].toString();
    title = map[' title'];
    note = map['note'];
    date = map['date'];
    startTime = map['startTime'];
    endTime = map['endTime'];
  }
}
