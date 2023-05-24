class profile {
  final String name;
  bool check = false;
  profile({required this.name});
  String getName() => name;
  bool getCheck() => check;
  void setCheck(bool check) => this.check = check;
}
