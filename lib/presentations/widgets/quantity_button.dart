import 'package:flutter/material.dart';

/// Construye un botón para ajustar la cantidad.
  Widget buildQuantityButton({
    required IconData icon,
    required Color color,
    Color? iconColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 25.0,
        width: 25.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: color,
        ),
        child: Center(
          child: Icon(icon, color: iconColor ?? Colors.white, size: 20.0),
        ),
      ),
    );
  }