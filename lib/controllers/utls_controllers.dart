import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/functions.dart';

class UtlControllers {
  void to(Widget page, BuildContext context) {
    Navigator.of(context).push(createRouteTrans(page));
  }

  void copyToClipboard(String textToCopy, BuildContext context) {
    Clipboard.setData(ClipboardData(text: textToCopy));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Copied to clipboard: $textToCopy',
        ),
      ),
    );
  }
}
