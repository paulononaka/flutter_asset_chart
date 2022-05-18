import 'package:flutter_asset_chart/hello/hello_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Portfolio golden test', (WidgetTester tester) async {
    await loadAppFonts();

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.iphone11])
      ..addScenario(widget: const HelloScreen());
    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'helo_screen');
  });
}
