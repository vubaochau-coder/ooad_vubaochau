class UserSingleton {
  late String address;
  late int dayoff;
  late String email;
  late String id;
  late String idDepartment;
  late String name;
  late String phoneNumber;
  late String position;
  late int taskCountSuccess;
  late int taskCountTotal;
  late int levelPermission;
  static final UserSingleton _instance = UserSingleton._internal();

  factory UserSingleton({
    address,
    dayoff,
    email,
    id,
    idDepartment,
    name,
    phoneNumber,
    position,
    taskCountSuccess,
    taskCountTotal,
    levelPermission,
  }) {
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
  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'dayoff': dayoff,
        'email': email,
        'id': id,
        'phoneNumber': phoneNumber,
        'position': position,
        'taskCountTotal': taskCountTotal,
        'levelPremission': levelPermission,
        'idDepartment': idDepartment,
        'taskCountSuccess': taskCountSuccess,
      };

  static UserSingleton fromJson(Map<String, dynamic> json) => UserSingleton(
        name: json['name'],
        position: json['position'],
        address: json['address'],
        dayoff: json['dayoff'],
        email: json['email'],
        id: json['id'],
        phoneNumber: json['phoneNumber'],
        taskCountTotal: json['taskCountTotal'],
        taskCountSuccess: json['taskCountSuccess'],
        idDepartment: json['idDepartment'],
        levelPermission: json['levelPermission'],
      );

  UserSingleton._internal();
}
