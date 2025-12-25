import 'package:flutter/material.dart';

class BottomTabItem {
  final String label;
  final IconData icon;
  final Widget page;
  final bool admin;
  final bool manager;
  final bool isCenter;

  BottomTabItem({
    required this.label,
    required this.icon,
    required this.page,
    this.admin = true,
    this.manager = true,
    this.isCenter = false,
  });
}
