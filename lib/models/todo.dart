class Todo {
  String title;
  bool isDone;
  DateTime? due;

  Todo({required this.title, this.isDone = false, this.due});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
      'due': due?.toIso8601String(),
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'],
      isDone: json['isDone'],
      due: json['due'] != null ? DateTime.parse(json['due']) : null,
    );
  }
}
