class account {
  final String name;
  String pass;
  account({required this.name, required this.pass});
  String getName() => name;
  String getPass() => pass;
  void setPass({String? pass}) => this.pass = pass!;
}
