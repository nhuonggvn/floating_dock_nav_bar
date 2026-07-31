# Floating Dock Navigation Bar (`floating_dock_nav_bar`)

A premium macOS and Telegram style Floating Dock Navigation Bar for Flutter applications.

## Features

- 🎨 **macOS & Telegram Aesthetic**: Premium floating dock layout with smooth rounded corners and translucent shadows.
- ⚡ **100% Customizable**: Tailor active/inactive colors, background color, elevation, margin, border, height, and border radius.
- 📱 **Multi-Device Safe**: Auto-adjusts padding and safe areas for modern iOS & Android devices.
- 🔴 **Badge Support**: Optional badge widgets on individual tab items.

## Installation

Add this dependency to your `pubspec.yaml`:

```yaml
dependencies:
  floating_dock_nav_bar:
    git:
      url: https://github.com/nhuonggvn/floating_dock_nav_bar.git
      ref: main
```

## Quick Start

```dart
import 'package:flutter/material.dart';
import 'package:floating_dock_nav_bar/floating_dock_nav_bar.dart';

class HomeScreenShell extends StatefulWidget {
  const HomeScreenShell({super.key});

  @override
  State<HomeScreenShell> createState() => _HomeScreenShellState();
}

class _HomeScreenShellState extends State<HomeScreenShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          Center(child: Text('Home Screen')),
          Center(child: Text('Calendar Screen')),
          Center(child: Text('Good Hours Screen')),
          Center(child: Text('Energy Screen')),
          Center(child: Text('Profile Screen')),
        ],
      ),
      bottomNavigationBar: FloatingDockNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        activeColor: const Color(0xFF064E3B),
        inactiveColor: const Color(0xFF707974),
        items: const [
          DockNavItem(
            icon: Icons.home_rounded,
            outlinedIcon: Icons.home_outlined,
            label: 'Hôm nay',
          ),
          DockNavItem(
            icon: Icons.calendar_month_rounded,
            outlinedIcon: Icons.calendar_month_outlined,
            label: 'Lịch',
          ),
          DockNavItem(
            icon: Icons.access_time_filled_rounded,
            outlinedIcon: Icons.access_time_outlined,
            label: 'Giờ tốt',
          ),
          DockNavItem(
            icon: Icons.bolt_rounded,
            outlinedIcon: Icons.bolt_outlined,
            label: 'Năng lượng',
          ),
          DockNavItem(
            icon: Icons.person_rounded,
            outlinedIcon: Icons.person_outline_rounded,
            label: 'Cá nhân',
          ),
        ],
      ),
    );
  }
}
```

## License
- MIT license


