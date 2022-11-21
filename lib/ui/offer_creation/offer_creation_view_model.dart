import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../models/unsplash_image.dart';
import '../../services/hive_manager.dart';
import '../../services/unsplash_image_provider.dart';
import '../home/home_view.dart';

class OfferCreationViewModel extends ChangeNotifier {
  var confirmed = false;

  // BOLT12
  var quantityMin = 1;
  var description = '';
  var limitDescription = 'No limits set.';
  var currency = 'msat';
  var generatedDescription = '';

  num? amount;
  int? quantityMax;

  void initialise(BuildContext context) {
    generateDescription();
  }

  void generateDescription() {
    if (amount != null) {
      generatedDescription = '$amount';
    }
    if (currency != null) {
      generatedDescription = '$generatedDescription $currency';
    }
    if (limitDescription != 'No limits set.') {
      generatedDescription =
          '$generatedDescription, $limitDescription'.toLowerCase();
    } else {
      generatedDescription = 'Generic offer.';
    }
    notifyListeners();
  }

  Future<void> navigateAndDisplayAmount(BuildContext context) async {
    print('Changing some values.');
    amount = 1000;
    currency = 'sats';

    quantityMax = 50;
    if (quantityMax != null) {
      limitDescription = 'Up to $quantityMax times.';
    } else {
      limitDescription = 'No limits set.';
    }

    if (description.isEmpty) {
      generateDescription();
    }

    confirmed = validatingInputs();
    notifyListeners();
  }

  // Validation of BOLT12 spec.
  bool validatingInputs() {
    confirmed = true;
    if (amount != null) {
      assert(amount! > 0);
    } else {
      confirmed = false;
    }
    return confirmed;
  }

  Future<void> saveOffer(BuildContext context) async {
    print('Offer is being saved');

    if (description.isEmpty) {
      description = generatedDescription;
    }

    // Retrieve a random `nature` background image.
    var localPath = '';
    try {
      UnsplashImage imageData = await _loadRandomImage(keyword: 'chocolate');
      localPath = await _downloadFile(imageData.getRegularUrl());
    } catch (e) {
      // If it fails, use the default image.
      localPath = 'assets/images/joanna-kosinska-4dnG4q3kxdg-unsplash.jpeg';
    }

    final hiveManager = HiveManager();
    hiveManager.addToBox(
      imagePath: localPath,
      description: description,
      amountMsat: amount.toString(),
      quantityMin: quantityMin.toString(),
      quantityMax: quantityMax.toString(),
    );

    // Use pushReplacement to force a refresh.
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeView()));
  }

  // Requests a [UnsplashImage] for a given [keyword] query.
  //
  // If the given [keyword] is null, any random image is loaded.
  Future<UnsplashImage> _loadRandomImage({String? keyword}) async {
    var imageData =
        await UnsplashImageProvider.loadRandomImage(keyword: keyword);
    return imageData;
  }

  Future<String> _downloadFile(String url) async {
    // Default background image.
    var localPath = 'assets/images/geran-de-klerk-qzgN45hseN0-unsplash.jpeg';
    var response = await http.get(Uri.parse(url));

    // Get the image name.
    var imageName = path.basename(url);

    // Get the document directory path.
    var appDir = await path_provider.getApplicationDocumentsDirectory();
    // This is the saved image path.
    localPath = path.join(appDir.path, imageName);

    // Download locally.
    var imageFile = File(localPath);
    await imageFile.writeAsBytes(response.bodyBytes);
    return localPath;
  }
}
