import 'package:flutter/material.dart';
import 'package:go_modular_example/app/shared/ui/boundary_widget.dart';

class SimpleCard extends StatelessWidget {
  final String title;
  final String description;

  const SimpleCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BoundaryWidget(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(title),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}
