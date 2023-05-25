class account {
  String name;
  final String email;
  String pass;
  account({required this.email, required this.name, required this.pass});
  String getName() => name;
  String getPass() => pass;
  String getEmail() => email;
  void setPass({String? pass}) => this.pass = pass!;
  void setName({String? name}) => this.name = name!;
}
