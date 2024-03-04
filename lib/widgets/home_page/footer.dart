import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_image.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/utils/error_toast.dart';
import 'package:flutter_application_1/widgets/home_page/button.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double deviceWidth = mediaQueryData.size.width;
    return Padding(
      padding: paddingOnlyTopSuperBig,
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        padding: paddingAllBig * 1.5,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                          image: const AssetImage(
                              PageImageConstants.loginHeaderImage),
                          width: deviceWidth / 3.5),
                      CustomButton(
                        onPressed: () {
                          ToastHelper.showErrorToast(
                              ProfileEditConstants.featureUnavailable);
                        },
                        buttonText: FooterConstants.contactUs,
                        buttonColor: Theme.of(context).colorScheme.background,
                        buttonTextColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: paddingBig,
              child: Text(
                FooterConstants.tobeto,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
