import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/material.dart';
import 'package:clan_wealth/amplifyconfiguration.dart';

class ClanWealthPage extends StatefulWidget {
  @override
  _ClanWealthPageState createState() => _ClanWealthPageState();
}

class _ClanWealthPageState extends State<ClanWealthPage> {
  bool _amplifyConfigured = false;

  // Instantiate Amplify
  Amplify amplifyInstance = Amplify();

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    if (!mounted) return;
    // Add Pinpoint and Cognito Plugins
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    amplifyInstance.addPlugin(authPlugins: [authPlugin]);

    // Once Plugins are added, configure Amplify
    await amplifyInstance.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Amplify Core example app'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(5.0)),
                  Text(_amplifyConfigured ? "configured" : "not configured"),
                  RaisedButton(
                    onPressed: () {},
                    child: const Text('record event'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
