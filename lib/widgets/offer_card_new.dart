import 'package:flutter/material.dart';

import '../ui/offer_creation/offer_creation_view.dart';

class OfferCardNew extends StatelessWidget {
  const OfferCardNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              'assets/images/joanna-kosinska-4dnG4q3kxdg-unsplash.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 0.0,
          child: TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const OfferCreationView())),
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.0),
                ),
              ),
            ),
            child: const Text('Create'),
          ),
        ),
      ],
    );
  }
}
