import 'dart:convert';

TaskModel taskModelFromJson(String str) => TaskModel.fromJson(json.decode(str));

String taskModelToJson(TaskModel data) => json.encode(data.toJson());

class TaskModel {
    TaskModel({
        this.id,
        this.title,
        this.date,
        this.status,
    });

    String id;
    String title;
    String date;
    String status;

    factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        id: json["id"],
        title: json["title"],
        date: json["date"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "date": date,
        "status": status,
    };
}

// class Task {
//   int id;
//   String title;
//   DateTime date;
//   int status; // 0 - incomplete, 1 - complete

//   Task({this.title, this.date, this.status});
//   Task.withId({this.id, this.title, this.date, this.status});

//   Map<String, dynamic> toMap() {
//     final map = Map<String, dynamic>();
//     if (id != null) {
//       map['id'] = id;
//     }
//     map['title'] = title;
//     map['date'] = date;
//     map['status'] = status;
//   }

//   factory Task.fromMap(Map<String, dynamic> map) {
//     return Task.withId(
//       id: map["id"],
//       title: map["title"],
//       date: DateTime.parse(map["date"]),
//       status: map["status"],
//     );
//   }
// }
