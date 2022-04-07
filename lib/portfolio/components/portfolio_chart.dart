import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_asset_chart/design_system/color_palette.dart';
import 'package:flutter_asset_chart/design_system/components/asset_dash_box.dart';
import 'package:flutter_asset_chart/design_system/formatters/money_formatter.dart';
import 'package:flutter_asset_chart/design_system/sizes.dart';
import 'package:flutter_asset_chart/design_system/text_theme.dart';
import 'package:flutter_asset_chart/generated/l10n.dart';
import 'package:flutter_asset_chart/portfolio/components/holding_row.dart';
import 'package:flutter_asset_chart/portfolio/portfolio_cubit.dart';
import 'package:flutter_asset_chart/portfolio/presentations/pie_data.dart';

class PortfolioChart extends StatefulWidget {
  final PortfolioCubit cubit;
  final List<PieData> data;
  final List<String> holdingTypes;
  final String selectedType;
  final int total;

  const PortfolioChart({Key? key, required this.cubit, required this.data, required this.holdingTypes, required this.total, required this.selectedType})
      : super(key: key);

  @override
  State<PortfolioChart> createState() => _PortfolioChartState();
}

class _PortfolioChartState extends State<PortfolioChart> {
  final ScrollController _scrollController = ScrollController();
  PieData? touchedData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Sizes.defaultPadding),
      child: AssetDashBox(
        title: S.of(context).porfolioChart,
        children: [
          _pieChart(widget.data, widget.total),
          _portfolioHoldings(widget.data, widget.holdingTypes, widget.selectedType),
        ],
      ),
    );
  }

  Widget _pieChart(List<PieData> data, int total) {
    return SizedBox(
      height: 190,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              touchedData == null ? "100%" : "${touchedData!.percentage}%",
              style: TextStyles.subtitle1,
              textAlign: TextAlign.center,
            ),
          ),
          PieChart(
            PieChartData(
              sections: data
                  .map(
                    (pieData) => PieChartSectionData(
                      color: pieData.color,
                      value: pieData.holding.value.toDouble(),
                      radius: touchedData == pieData ? 35.0 : 25.0,
                      title: touchedData == pieData ? pieData.holding.name : '',
                    ),
                  )
                  .toList(),
              pieTouchData: PieTouchData(touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                    touchedData = null;
                    return;
                  }
                  final touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                  if (touchedIndex >= 0) {
                    touchedData = data[touchedIndex];
                  }
                });
              }),
              sectionsSpace: 0,
              centerSpaceRadius: 50,
            ),
            swapAnimationDuration: const Duration(milliseconds: 150),
            swapAnimationCurve: Curves.linear,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(MoneyFormatter(context).format(total), style: TextStyles.subtitle1, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  Widget _portfolioHoldings(List<PieData> data, List<String> holdingTypes, String selectedType) {
    return Expanded(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(S.of(context).portfolioHoldings),
                const Spacer(),
                DropdownButton<String>(
                  underline: const SizedBox(),
                  items:
                      holdingTypes.map((holdingType) => DropdownMenuItem(child: Text(holdingType, style: TextStyles.subtitle2), value: holdingType)).toList(),
                  hint: Text(S.of(context).allHoldings, style: TextStyles.subtitle2),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  value: selectedType,
                  onChanged: (holdingType) {
                    if (holdingType != null) widget.cubit.selectHoldingType(context, holdingType);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: ColorPalette.background,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView(
                controller: _scrollController,
                padding: const EdgeInsets.all(2),
                children: data.map((PieData pieData) => HoldingRow(pieData: pieData, color: pieData.color)).toList(),
              ),
            ),
          ),
          const SizedBox(height: 8)
        ],
      ),
    );
  }
}
