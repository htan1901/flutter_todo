import 'package:flutter/material.dart';
import 'package:todo/models/todo.dart';

class ListViewItem extends StatefulWidget {
  late Todo _todo;
  ListViewItem({Key? key, required Todo todo})
      : _todo = todo,
        super(key: key);

  @override
  State<ListViewItem> createState() => _ListViewItemState(_todo);
}

class _ListViewItemState extends State<ListViewItem> {
  late Todo _todo;
  bool _isChecked = false;

  _ListViewItemState(this._todo);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: !_isChecked,
      leading: Checkbox(
          shape: const CircleBorder(),
          value: _isChecked,
          visualDensity: VisualDensity.compact,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value!;
            });
          }),
      title: Text(_todo.title, style: renderEffect(_isChecked),),
      subtitle: _todo.detail == null ? null : Text(_todo.detail!, style: renderEffect(_isChecked),),
    );
  }

  TextStyle? renderEffect(bool isDisable) {
    if (isDisable) {
      return const TextStyle(
        decoration: TextDecoration.lineThrough
      );
    }
    return null;
  }
}
