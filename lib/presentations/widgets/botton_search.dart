import 'package:flutter/material.dart';

class BottonSearch extends StatelessWidget {
  final Function? onPressed;
  const BottonSearch({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      backgroundColor: Color(0xFF21BFBD),
      child: Icon(Icons.search, color: Colors.white),
    );
  }
}
