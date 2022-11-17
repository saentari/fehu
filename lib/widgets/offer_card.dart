import 'package:flutter/material.dart';

import '../models/offer.dart';
import '../ui/theme.dart';

class OfferCard extends StatelessWidget {
  const OfferCard(this.offer, {super.key});

  final Offer offer;

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
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            color: customBlack.withOpacity(0.5),
            child: Text(
              offer.description,
              style: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
