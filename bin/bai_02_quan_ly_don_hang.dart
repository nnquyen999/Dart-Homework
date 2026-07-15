import 'dart:io';

void main() {
  stdout.write('Nhập tên sản phẩm: ');
  String tenSanPham = stdin.readLineSync()!;

  stdout.write('Nhập số lượng mua: ');
  int soLuong = int.parse(stdin.readLineSync()!);

  stdout.write('Nhập đơn giá: ');
  double donGia = double.parse(stdin.readLineSync()!);

  double thanhTien = soLuong * donGia;
  double giamGia = 0;

  if (thanhTien >= 1000000) {
    giamGia = thanhTien * 10 / 100;
  } else if (thanhTien >= 500000) {
    giamGia = thanhTien * 5 / 100;
  }

  double tienSauGiam = thanhTien - giamGia;
  double thueVat = tienSauGiam * 8 / 100;
  double tongThanhToan = tienSauGiam + thueVat;

  print('\nHÓA ĐƠN BÁN HÀNG');
  print('Tên sản phẩm: $tenSanPham');
  print('Số lượng: $soLuong');
  print('Đơn giá: ${donGia.toStringAsFixed(0)} VNĐ');
  print('Thành tiền: ${thanhTien.toStringAsFixed(0)} VNĐ');
  print('Giảm giá: ${giamGia.toStringAsFixed(0)} VNĐ');
  print('Thuế VAT: ${thueVat.toStringAsFixed(0)} VNĐ');
  print('Tổng thanh toán: ${tongThanhToan.toStringAsFixed(0)} VNĐ');
}
