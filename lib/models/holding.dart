import 'package:json_annotation/json_annotation.dart';

part 'holding.g.dart';

@JsonSerializable()
class Holding {
  String ticker;
  String name;
  String type;
  int value;

  Holding({
    required this.ticker,
    required this.name,
    required this.type,
    required this.value,
  });

  factory Holding.fromJson(Map<String, dynamic> json) => _$HoldingFromJson(json);
  Map<String, dynamic> toJson() => _$HoldingToJson(this);

  @override
  String toString() => 'Holding{ticker: $ticker, name: $name, type: $type, value: $value}';
}
