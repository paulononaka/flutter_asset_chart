import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/design_system/formatters/money_formatter.dart';
import 'package:flutter_asset_chart/design_system/text_theme.dart';
import 'package:flutter_asset_chart/portfolio/presentations/pie_data.dart';

class HoldingRow extends StatelessWidget {
  final PieData pieData;
  final Color color;

  const HoldingRow({Key? key, required this.pieData, required this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            margin: const EdgeInsets.only(right: 18),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              "${pieData.holding.name} - ${pieData.holding.ticker} - ${pieData.percentage}% - ${MoneyFormatter(context).format(pieData.holding.value)}",
              style: TextStyles.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
