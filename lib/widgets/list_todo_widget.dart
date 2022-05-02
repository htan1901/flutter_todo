import 'package:flutter/material.dart';
import 'package:test_app/models/todo.dart';
import 'package:test_app/widgets/todo_screen.dart';

class ListTodoWidget extends StatelessWidget {
  List<Todo> _todos = [];

  ListTodoWidget({Key? key, required List<Todo> data}) : super(key: key) {
    _todos = data;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              child: ListTile(
                  title: Text(_todos[index].title),
              ), 
              onTap: () {
                Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => TodoScreen(todo: _todos[index]))
                    );
              },
          );
        },
    );
  }

}
