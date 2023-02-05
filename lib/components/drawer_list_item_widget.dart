import 'package:flutter/material.dart';

class DrawerListItemWidget extends StatelessWidget {
  final IconData? icon;
  final String label;
  final GestureTapCallback? onTap;

  const DrawerListItemWidget({
    super.key,
    this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 24,
      ),
      title: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13,
        ),
      ),
      onTap: onTap,
    );
  }
}
