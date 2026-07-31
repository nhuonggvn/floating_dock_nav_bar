import 'package:flutter/material.dart';
import 'dock_nav_item.dart';

/// FloatingDockNavBar - Thanh Bottom Navigation Bar kiểu Dock nổi cao cấp (floating bar)
/// Tương tự macOS Dock và Telegram, hỗ trợ tùy biến 100% màu sắc, kích thước và hiệu ứng bóng đổ.
class FloatingDockNavBar extends StatelessWidget {
  /// Index của item đang được chọn.
  final int currentIndex;

  /// Callback khi người dùng ấn vào một tab item.
  final ValueChanged<int> onTap;

  /// Danh sách các item trên thanh Dock.
  final List<DockNavItem> items;

  /// Màu sắc icon và text khi item được chọn.
  final Color activeColor;

  /// Màu sắc icon và text khi item chưa được chọn.
  final Color inactiveColor;

  /// Màu nền hiệu ứng bo tròn của item được chọn.
  final Color? activeBackgroundColor;

  /// Màu nền của toàn bộ thanh Dock.
  final Color backgroundColor;

  /// Chiều cao thanh Dock.
  final double height;

  /// Chiều rộng tối đa của thanh Dock.
  final double maxWidth;

  /// Độ bo cong các góc của thanh Dock.
  final double borderRadius;

  /// Đường viền xung quanh thanh Dock.
  final BoxBorder? border;

  /// Danh sách các hiệu ứng đổ bóng xung quanh thanh Dock.
  final List<BoxShadow>? boxShadow;

  /// Khoảng cách Margin xung quanh thanh Dock.
  final EdgeInsetsGeometry margin;

  /// Kích thước Icon.
  final double iconSize;

  /// Font size của nhãn văn bản.
  final double fontSize;

  const FloatingDockNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.activeColor = const Color(0xFF064E3B),
    this.inactiveColor = const Color(0xFF707974),
    this.activeBackgroundColor,
    this.backgroundColor = Colors.white,
    this.height = 60.0,
    this.maxWidth = 450.0,
    this.borderRadius = 32.0,
    this.border,
    this.boxShadow,
    this.margin = const EdgeInsets.only(
      left: 20.0,
      right: 20.0,
      top: 8.0,
      bottom: 6.0,
    ),
    this.iconSize = 22.0,
    this.fontSize = 9.5,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveActiveBgColor =
        activeBackgroundColor ?? activeColor.withValues(alpha: 0.08);

    final defaultBorder = Border.all(
      color: const Color(0xFFE7E9E5).withValues(alpha: 0.6),
      width: 1,
    );

    final defaultBoxShadow = [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 20,
        spreadRadius: 1,
        offset: const Offset(0, 8),
      ),
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.02),
        blurRadius: 6,
        offset: const Offset(0, 2),
      ),
    ];

    return SafeArea(
      top: false,
      child: Padding(
        padding: margin,
        child: Center(
          heightFactor: 1.0,
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ?? defaultBorder,
              boxShadow: boxShadow ?? defaultBoxShadow,
            ),
            child: Row(
              children: List.generate(items.length, (index) {
                final item = items[index];
                return _buildNavItem(
                  context: context,
                  index: index,
                  item: item,
                  activeBgColor: effectiveActiveBgColor,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required DockNavItem item,
    required Color activeBgColor,
  }) {
    final bool isSelected = currentIndex == index;
    final Color itemColor = isSelected
        ? (item.activeColor ?? activeColor)
        : inactiveColor;
    final IconData displayIcon =
        isSelected ? item.icon : (item.outlinedIcon ?? item.icon);

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Container(
            width: double.infinity,
            height: height - 12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? activeBgColor : Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      displayIcon,
                      size: iconSize,
                      color: itemColor,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item.label,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight:
                            isSelected ? FontWeight.w700 : FontWeight.w500,
                        color: itemColor,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
                if (item.badge != null)
                  Positioned(
                    top: 2,
                    right: 12,
                    child: item.badge!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
