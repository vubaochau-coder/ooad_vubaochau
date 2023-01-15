class UserSingleton {
  late String name;
  late String id;
  late String phoneNumber;
  late String email;
  late String address;
  late int dayoff;
  late int levelPermission;
  late int taskCountTotal;
  late int taskCountSuccess;
  late String position;
  late String idDepartment;

  static final UserSingleton _instance = UserSingleton._internal();

  factory UserSingleton(
      {name,
      id,
      phoneNumber,
      email,
      address,
      dayoff,
      taskCountTotal,
      taskCountSuccess,
      position,
      levelPermission,
      idDepartment}) {
    _instance.name = name;
    _instance.address = address;
    _instance.dayoff = dayoff;
    _instance.email = email;
    _instance.id = id;
    _instance.phoneNumber = phoneNumber;
    _instance.position = position;
    _instance.taskCountSuccess = taskCountSuccess;
    _instance.taskCountTotal = taskCountTotal;
    _instance.levelPermission = levelPermission;
    _instance.idDepartment = idDepartment;

    return _instance;
  }

  UserSingleton._internal();
}
