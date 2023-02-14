class NhanVienDoanTheItemModel {
  final String id;
  final String name;
  final String ngayThamGia;
  final String ngayNghi;

  NhanVienDoanTheItemModel(
      {required this.id,
      required this.name,
      required this.ngayThamGia,
      required this.ngayNghi});
}

List<NhanVienDoanTheItemModel> NhanVienDoanTheList = [
  NhanVienDoanTheItemModel(
      id: "NV01",
      name: "Nguyên Văn A",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  NhanVienDoanTheItemModel(
      id: "NV02",
      name: "Nguyên Văn B",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  NhanVienDoanTheItemModel(
      id: "NV03",
      name: "Nguyên Văn C",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  NhanVienDoanTheItemModel(
      id: "NV04",
      name: "Nguyên Văn D",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
  NhanVienDoanTheItemModel(
      id: "NV05",
      name: "Nguyên Văn E",
      ngayThamGia: "26/03/2002",
      ngayNghi: "28/03/2002"),
];
