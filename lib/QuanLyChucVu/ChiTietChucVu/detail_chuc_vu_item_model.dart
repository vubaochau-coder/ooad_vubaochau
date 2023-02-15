class DetailInfoChucVu {
  final String idChucVu;
  final String nameChucVu;
  final String idDonVi;
  final double phuCap;
  final List<Map<String, String>> mem;

  DetailInfoChucVu({
    required this.idChucVu,
    required this.idDonVi,
    required this.nameChucVu,
    required this.mem,
    required this.phuCap,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': nameChucVu,
      'phuCap': phuCap,
    };
  }
}
