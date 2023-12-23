class Tasks {
  Tasks({this.name, this.isDone = false});

  String? name;
  bool? isDone;

  void toggleDone() {
    isDone = isDone == null ? true : !isDone!;
  }
}
