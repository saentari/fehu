import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stacked/stacked.dart';

import '../../models/offer.dart';
import '../../widgets/safe_area.dart';
import '../custom_icons.dart';
import '../theme.dart';
import 'qr_view_model.dart';

class QrView extends StatelessWidget {
  final Offer offer;

  const QrView(this.offer, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QRViewModel>.reactive(
      viewModelBuilder: () => QRViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(context),
      builder: (context, model, child) => SafeAreaX(
        appBar: AppBar(
          centerTitle: true,
          title: titleIcon,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
        ),
        bottomBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.0),
                ),
              ),
            ),
            child: const Text('Close'),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: customWhite,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  QrImageView(
                    eyeStyle: const QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: customBlack,
                    ),
                    dataModuleStyle: const QrDataModuleStyle(
                        dataModuleShape: QrDataModuleShape.circle,
                        color: customBlack),
                    data: offer.description,
                    version: QrVersions.auto,
                    size: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 24.0),
                  GestureDetector(
                    onTap: () => model.setClipboard(context, offer.description),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            offer.description,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: customDarkNeutral5,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        const Icon(
                          CupertinoIcons.doc_on_doc_fill,
                          color: customDarkNeutral5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
