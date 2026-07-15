import 'dart:io';

void main() {
  stdout.write('Nhập họ tên: ');
  String hoTen = stdin.readLineSync()!;

  stdout.write('Nhập số giờ làm: ');
  double soGio = double.parse(stdin.readLineSync()!);

  stdout.write('Nhập lương mỗi giờ: ');
  double luongMoiGio = double.parse(stdin.readLineSync()!);

  double tongLuong = soGio * luongMoiGio;

  if (soGio > 40) {
    tongLuong = tongLuong + tongLuong * 20 / 100;
  }

  double thue = 0;

  if (tongLuong > 10000000) {
    thue = tongLuong * 10 / 100;
  } else if (tongLuong >= 7000000) {
    thue = tongLuong * 5 / 100;
  }

  double luongThucLanh = tongLuong - thue;

  print('\nHọ tên: $hoTen');
  print('Tổng lương trước thuế: ${tongLuong.toStringAsFixed(0)} VNĐ');
  print('Thuế thu nhập: ${thue.toStringAsFixed(0)} VNĐ');
  print('Lương thực lãnh: ${luongThucLanh.toStringAsFixed(0)} VNĐ');
}
