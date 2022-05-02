import 'package:flutter/material.dart';
import 'package:test_app/models/todo.dart';

class TodoScreen extends StatefulWidget {
  late Todo _todo;
  TodoScreen({Key? key, required Todo todo})
      : _todo = todo,
        super(key: key);

  @override
  State<TodoScreen> createState() => _TodoScreenState(_todo);
}

class _TodoScreenState extends State<TodoScreen> {
  late Todo _todo;

  _TodoScreenState(this._todo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Todo Application'),
        ),
        body: buildScreen());
  }

  Widget buildScreen() {
    Text titleText = Text(_todo.title);
    Text detailText = Text(_todo.detail);
    Text expireDateText = Text(_todo.expireDate ?? 'Not expire');
    return Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
    );
  }
}
