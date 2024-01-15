import 'package:boiler_plate/environment.dart';

void main() => Development();

class Development extends Environment {
  final String appName = "News Dev";
  @override
  final String baseUrl = 'https://newsapi.org/v2';
  @override
  EnvType environmentType = EnvType.DEVELOPMENT;
}
