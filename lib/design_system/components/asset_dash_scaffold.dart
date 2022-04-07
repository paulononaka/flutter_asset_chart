import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/design_system/images.dart';
import 'package:flutter_asset_chart/design_system/sizes.dart';

class AssetDashScaffold extends StatelessWidget {
  const AssetDashScaffold({
    Key? key,
    required this.body,
    this.title,
    this.hasBackButton = true,
    this.logoutOnPressed,
  }) : super(key: key);

  final Widget body;
  final bool hasBackButton;
  final VoidCallback? logoutOnPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(height: size.width * 0.3, child: Images.mainTop),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(height: size.width * 0.3, child: Images.mainBottom),
            ),
            Padding(
              padding: EdgeInsets.all(Sizes.defaultPadding),
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}
