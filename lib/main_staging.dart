import 'package:boiler_plate/environment.dart';

void main() => Staging();

class Staging extends Environment {
  final String appName = "News Staging";
  @override
  final String baseUrl = 'https://newsapi.org/v2';
  @override
  EnvType environmentType = EnvType.STAGING;
}
