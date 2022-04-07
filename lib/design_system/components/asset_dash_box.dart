import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/design_system/sizes.dart';

class AssetDashBox extends StatelessWidget {
  final List<Widget> children;
  final String title;

  const AssetDashBox({
    Key? key,
    required this.children,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: Sizes.defaultBorderRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(Sizes.defaultPadding),
            child: Text(title),
          ),
          ...children,
        ],
      ),
    );
  }
}
