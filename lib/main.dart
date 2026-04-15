import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ================== DATA ==================

// 1. Người đặt
var listNguoiDat = [
  {'id': 1, 'ten': 'Nguyễn Văn Thắng', 'sdt': '0988', 'diaChi': 'Hà Nội'},
  {'id': 2, 'ten': 'Dương Trí Dũng', 'sdt': '0977', 'diaChi': 'Hà Nam'},
];

// 2. Phòng khám
var listPhong = [
  {'id': 1, 'tenPhong': 'Phòng 101', 'bacSi': 'BS A', 'diaChi': 'HN'},
  {'id': 2, 'tenPhong': 'Phòng 102', 'bacSi': 'BS B', 'diaChi': 'HN'},
];

// 3. Phiếu đặt lịch (liên kết)
var listPhieu = [
  {'idNguoi': 1, 'idPhong': 1, 'ngayDat': '15/04'},
  {'idNguoi': 2, 'idPhong': 2, 'ngayDat': '16/04'},
];

// ================== APP ==================
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Quản lý đặt lịch khám")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ===== 1. NGƯỜI ĐẶT =====
              Text("Danh sách người đặt:",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              ...listNguoiDat.map((nguoi) {
                return Row(
                  children: [
                    Text("ID: ${nguoi['id']}"),
                    SizedBox(width: 10),
                    Text("${nguoi['ten']}"),
                  ],
                );
              }).toList(),

              SizedBox(height: 20),

              // ===== 2. PHÒNG KHÁM =====
              Text("Danh sách phòng khám:",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              ...listPhong.map((phong) {
                return Row(
                  children: [
                    Text("${phong['tenPhong']}"),
                    SizedBox(width: 10),
                    Text("- ${phong['bacSi']}"),
                    SizedBox(width: 10),
                    Text("- ${phong['diaChi']}"),
                  ],
                );
              }).toList(),

              SizedBox(height: 20),

              // ===== 3. PHIẾU ĐẶT =====
              Text("Phiếu đặt lịch:",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              ...listPhieu.map((phieu) {
                // tìm người
                var nguoi = listNguoiDat.firstWhere(
                    (n) => n['id'] == phieu['idNguoi']);

                // tìm phòng
                var phong = listPhong.firstWhere(
                    (p) => p['id'] == phieu['idPhong']);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tên: ${nguoi['ten']}"),
                    Text("Phòng: ${phong['tenPhong']}"),
                    Text("Bác sĩ: ${phong['bacSi']}"),
                    Text("Ngày đặt: ${phieu['ngayDat']}"),
                    Divider(),
                  ],
                );
              }).toList(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}