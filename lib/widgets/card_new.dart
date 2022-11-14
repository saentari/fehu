import 'package:flutter/material.dart';

class CardNew extends StatelessWidget {
  const CardNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/joanna-kosinska-4dnG4q3kxdg-unsplash.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text('Create'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
