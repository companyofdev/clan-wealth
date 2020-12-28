import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:clan_wealth/amplifyconfiguration.dart';

class AmplifyService {
  bool _amplifyConfigured = false;
  Amplify _amplifyInstance = Amplify();

  AmplifyService._privateConstructor() {
    _configureAmplify();
  }

  static final AmplifyService _instance = AmplifyService._privateConstructor();

  factory AmplifyService() {
    return _instance;
  }

  bool get amplifyConfigured => _amplifyConfigured;
  Amplify get amplifyInstance => _amplifyInstance;

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    _amplifyInstance.addPlugin(authPlugins: [authPlugin]);

    // Once Plugins are added, configure Amplify
    await _amplifyInstance.configure(amplifyconfig);
    try {
      _amplifyConfigured = true;
    } catch (e) {
      print(e);
    }
  }
}
