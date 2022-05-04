class Todo {
  String _title = '';
  String? _detail = '';

  String get title => _title;
  String? get detail => _detail;

  set title(String title) {
    _title = title;
  }

  set detail(String? detail) {
    _detail = detail;
  }

  Todo({required String title,String? detail}) {
    _title = title;
    _detail = detail;
  }
}
