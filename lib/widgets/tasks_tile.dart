import 'package:flutter/material.dart';

class TasksTile extends StatelessWidget {
  final bool? isChecked;
  final String? name;
  final Function(bool?)? checkBoxCallback;
  final Function()? LongPressCallback;

  TasksTile(
      {required this.name,
      this.isChecked,
      this.checkBoxCallback,
      this.LongPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: LongPressCallback,
      title: Text(
        name ?? '', // Use the 'name' parameter instead of hardcoded text
        style: TextStyle(
          fontSize: 20,
          decoration: (isChecked ?? false)
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.blue,
        value: isChecked,
        onChanged: checkBoxCallback,
      ),
    );
  }
}
