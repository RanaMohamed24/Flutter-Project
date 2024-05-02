
class TaskModel {
  String? docId;
   String? title;
   String? note;
   String? date;
   String? startTime;
  String? endTime;

  TaskModel(
    {this.docId,
     this.title,
     this.note,
     this.date,
     this.startTime,
     this.endTime});

  TaskModel.fromJson(Map map) {
    docId = map['docId'].toString();
    title = map[' title'];
    note = map['note'];
    date = map['date'].toString();
    startTime = map['startTime'].toString();
    endTime = map['endTime'].toString();
  }
}
