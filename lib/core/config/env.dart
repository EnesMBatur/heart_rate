import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'lib/core/env/.env')
abstract class Env {
  @EnviedField(varName: 'BASE_URL', obfuscate: true)
  static final String baseUrl = _Env.baseUrl;

  @EnviedField(varName: 'API_KEY', obfuscate: true)
  static final String apiKey = _Env.apiKey;

  // @EnviedField(varName: 'REVENUECAT_GOOGLE', obfuscate: true)
  // static final String revenuecatGoogle = _Env.revenuecatGoogle;

  // @EnviedField(varName: 'REVENUECAT_APPLE', obfuscate: true)
  // static final String revenuecatApple = _Env.revenuecatApple;
}
