

import 'package:flutter/material.dart';

class BoundaryWidget extends StatelessWidget {
  final Widget? child;

  const BoundaryWidget({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      color: const Color(0x80A0A0A0),
      child: child,
    );
  }
}
