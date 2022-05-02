class Todo {
  String _title = '';
  String _detail = '';
  String? _expireDate;

  String get title => _title;
  String get detail => _detail;
  String? get expireDate => _expireDate;

  set title(String title) {
    _title = title;
  }

  set detail(String detail) {
    _detail = detail;
  }
  
  set expireDate(String? expireDate) {
    _expireDate = expireDate;
  }


  Todo({required String title, required String detail, String? expireDate}) {
    _title = title;
    _detail = detail;
    _expireDate = expireDate; 
  }
}
