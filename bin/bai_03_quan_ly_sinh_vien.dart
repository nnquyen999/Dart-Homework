import 'dart:io';

class SinhVien {
  final String hoTen;
  final double toan, ly, hoa;

  SinhVien(this.hoTen, this.toan, this.ly, this.hoa);

  double get dtb => (toan + ly + hoa) / 3;

  String get xepLoai {
    if (dtb < 5) return 'Kém';
    if (dtb < 7) return 'Khá';
    if (dtb <= 9) return 'Giỏi';
    return 'Xuất sắc';
  }
}

String nhap(String thongBao) {
  stdout.write(thongBao);
  return stdin.readLineSync()?.trim() ?? '';
}

double nhapDiem(String mon) {
  while (true) {
    final diem = double.tryParse(nhap('Điểm $mon: '));
    if (diem != null && diem >= 0 && diem <= 10) return diem;
    print('Điểm phải nằm trong khoảng từ 0 đến 10.');
  }
}

void main() {
  final danhSach = <SinhVien>[];

  while (true) {
    print(
      '\n1. Thêm sinh viên\n'
      '2. Hiển thị danh sách\n'
      '3. Tìm sinh viên có ĐTB cao nhất\n'
      '4. Thoát',
    );

    switch (nhap('Chọn: ')) {
      case '1':
        danhSach.add(
          SinhVien(
            nhap('Họ tên: '),
            nhapDiem('Toán'),
            nhapDiem('Lý'),
            nhapDiem('Hóa'),
          ),
        );
        print('Thêm sinh viên thành công.');
        break;

      case '2':
        if (danhSach.isEmpty) {
          print('Danh sách trống.');
        } else {
          for (final sv in danhSach) {
            print(
              '${sv.hoTen} | ĐTB: ${sv.dtb.toStringAsFixed(2)}'
              ' | ${sv.xepLoai}',
            );
          }
        }
        break;

      case '3':
        if (danhSach.isEmpty) {
          print('Danh sách trống.');
        } else {
          final caoNhat = danhSach.reduce((a, b) => a.dtb >= b.dtb ? a : b);
          print(
            '${caoNhat.hoTen} | ĐTB cao nhất: '
            '${caoNhat.dtb.toStringAsFixed(2)}',
          );
        }
        break;

      case '4':
        print('Đã thoát chương trình.');
        return;

      default:
        print('Lựa chọn không hợp lệ.');
    }
  }
}
