class NgachItemModel {
  final String id;
  final String name;
  final int nienHan;
  final double bac1;
  final double bac2;
  final double bac3;
  final double bac4;
  final double bac5;
  final double bac6;
  final double bac7;

  NgachItemModel(
      {required this.id,
      required this.name,
      required this.nienHan,
      required this.bac1,
      required this.bac2,
      required this.bac3,
      required this.bac4,
      required this.bac5,
      required this.bac6,
      required this.bac7});
}

List<NgachItemModel> ngachList = [
  NgachItemModel(
      id: "01.003",
      name: "Chuyên Viên",
      nienHan: 3,
      bac1: 2.34,
      bac2: 2.67,
      bac3: 3.00,
      bac4: 3.33,
      bac5: 3.66,
      bac6: 3.99,
      bac7: 4.32),
  NgachItemModel(
      id: "06.031",
      name: "Kế Toán Viên",
      nienHan: 3,
      bac1: 2.34,
      bac2: 2.67,
      bac3: 3.00,
      bac4: 3.33,
      bac5: 3.66,
      bac6: 3.99,
      bac7: 4.32),
  NgachItemModel(
      id: "01.004",
      name: "Cán Sự",
      nienHan: 2,
      bac1: 1.86,
      bac2: 2.06,
      bac3: 2.26,
      bac4: 2.46,
      bac5: 2.66,
      bac6: 2.86,
      bac7: 3.06),
  NgachItemModel(
      id: "15.110",
      name: "Giảng Viên Chính",
      nienHan: 3,
      bac1: 4.40,
      bac2: 4.74,
      bac3: 5.08,
      bac4: 5.42,
      bac5: 5.76,
      bac6: 6.10,
      bac7: 6.44),
  NgachItemModel(
      id: "15.111",
      name: "Giảng Viên",
      nienHan: 3,
      bac1: 2.34,
      bac2: 2.67,
      bac3: 3.000,
      bac4: 3.33,
      bac5: 3.66,
      bac6: 3.99,
      bac7: 4.32),
  NgachItemModel(
      id: "01.007",
      name: "Nhân Viên Kỹ Thuật",
      nienHan: 2,
      bac1: 1.65,
      bac2: 1.83,
      bac3: 2.01,
      bac4: 2.19,
      bac5: 2.37,
      bac6: 2.55,
      bac7: 2.73),
  NgachItemModel(
      id: "01.11",
      name: "Nhân Viên Bảo Vệ",
      nienHan: 2,
      bac1: 1.50,
      bac2: 1.68,
      bac3: 1.86,
      bac4: 2.04,
      bac5: 2.22,
      bac6: 2.40,
      bac7: 2.58),
];
