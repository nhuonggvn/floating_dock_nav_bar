import 'package:flutter/widgets.dart';

/// Lớp đại diện cho từng item trên thanh Floating Dock Navigation Bar.
class DockNavItem {
  /// Icon khi item được chọn.
  final IconData icon;

  /// Icon nét mảnh (outlined) khi item chưa được chọn.
  final IconData? outlinedIcon;

  /// Nhãn văn bản bên dưới icon.
  final String label;

  /// Màu sắc tùy chỉnh riêng cho item này khi chọn (tùy chọn).
  final Color? activeColor;

  /// Thẻ thông báo badge số hoặc dấu chấm đỏ (tùy chọn).
  final Widget? badge;

  const DockNavItem({
    required this.icon,
    this.outlinedIcon,
    required this.label,
    this.activeColor,
    this.badge,
  });
}
