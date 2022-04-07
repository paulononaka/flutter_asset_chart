// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Holding _$HoldingFromJson(Map<String, dynamic> json) => Holding(
      ticker: json['ticker'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      value: json['value'] as int,
    );

Map<String, dynamic> _$HoldingToJson(Holding instance) => <String, dynamic>{
      'ticker': instance.ticker,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
    };
