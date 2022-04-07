import 'package:json_annotation/json_annotation.dart';

import 'holding.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  List<Holding> holdings;

  User({required this.holdings});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() => 'User{holdings: $holdings}';
}
