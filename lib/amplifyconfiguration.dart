const amplifyconfig = ''' {
    "analytics": {
        "plugins": {
            "awsPinpointAnalyticsPlugin": {
                "pinpointAnalytics": {
                    "appId": "2e5587d4451a42ee97a0f865aa39d070",
                    "region": "eu-west-1"
                },
                "pinpointTargeting": {
                    "region": "eu-west-1"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "eu-west-1:e014f76b-e71f-4be3-883b-002b1102d284",
                            "Region": "eu-west-1"
                        }
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "PinpointAnalytics": {
                    "Default": {
                        "AppId": "2e5587d4451a42ee97a0f865aa39d070",
                        "Region": "eu-west-1"
                    }
                },
                "PinpointTargeting": {
                    "Default": {
                        "Region": "eu-west-1"
                    }
                }
            }
        }
    }
}''';