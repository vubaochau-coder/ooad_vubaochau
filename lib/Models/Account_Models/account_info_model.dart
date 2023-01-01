class AccountInfoModel {
  final String id;
  final String name;
  final String position;
  final String dateCreate;
  final String lastLogin;
  final String email;
  late bool isActive;

  AccountInfoModel(
    this.id,
    this.name,
    this.dateCreate,
    this.lastLogin,
    this.email,
    this.position,
    this.isActive,
  );
}
