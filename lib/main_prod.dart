import 'package:boiler_plate/environment.dart';

void main() => Production();

class Production extends Environment {
  final String appName = "News";
  @override
  final String baseUrl = 'https://newsapi.org/v2';
  @override
  EnvType environmentType = EnvType.PRODUCTION;
}
