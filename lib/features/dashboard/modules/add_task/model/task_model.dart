class TaskModel {
  String? docId;
  String? title;
  String? note;
  String? date;
  String? startTime;
  String? endTime;
  // int? isCompleted;

  TaskModel({
    this.docId,
    this.title,
    this.note,
    this.date,
    this.startTime,
    this.endTime,
  });

  TaskModel.fromJson(Map map) {
    // print(map.toString());
    docId = map['id'].toString();
    title = map['title'];
    note = map['note'];
    date = map['date'];
    startTime = map['startTime'];
    endTime = map['endTime'];
    // isCompleted = map['endTime'];
  }
}
