import 'package:flutter/material.dart';

class RenderTitle extends StatelessWidget {
  final String label;

  const RenderTitle(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        label,
        style: const TextStyle(
            fontFamily: 'Raleway', fontSize: 25, fontWeight: FontWeight.bold),
      ),
    );
  }
}
