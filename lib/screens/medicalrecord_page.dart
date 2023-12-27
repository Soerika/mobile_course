import 'package:flutter/material.dart';

class MedicalRecordScreen extends StatelessWidget {
  const MedicalRecordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Medical Record'),
        // Các actions nếu cần thiết
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount:
                    5, // Thay đổi số lần khám tùy thuộc vào dữ liệu thực tế
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                          'Visit ${index + 1}'), // Thay đổi thông tin theo dữ liệu
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                              'Date: January 1, 2023'), // Thay đổi thông tin theo dữ liệu
                          Text(
                              'Diagnosis: Fever'), // Thay đổi thông tin theo dữ liệu
                          Text(
                              'Prescription: Paracetamol'), // Thay đổi thông tin theo dữ liệu
                        ],
                      ),
                      onTap: () {
                        // Xử lý khi người dùng nhấn vào một lần khám cụ thể
                        // Ví dụ: Hiển thị thông tin chi tiết, chuyển hướng đến trang chi tiết, vv.
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Xử lý khi người dùng nhấn nút để thêm lần khám mới
          // Ví dụ: Chuyển hướng đến màn hình thêm lần khám
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MedicalRecordScreen(),
    // Đặt các routes nếu cần thiết
  ));
}
