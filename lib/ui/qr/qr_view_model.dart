import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

import '../theme.dart';

class QRViewModel extends ChangeNotifier {
  void initialise(BuildContext context) {
    notifyListeners();
  }

  Future<void> setClipboard(BuildContext context, String address) async {
    // Clipboard.
    ClipboardData data = ClipboardData(text: address);
    await Clipboard.setData(data);

    // Emoji
    var parser = EmojiParser();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          // Return: 'Copied to clipboard 👍'.
          parser.emojify('Copied to clipboard :thumbsup:'),
          style: const TextStyle(color: customWhite, fontSize: 16.0),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: customDarkNeutral1,
      ),
    );
  }
}
