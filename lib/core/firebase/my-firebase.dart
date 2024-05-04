// ignore_for_file: file_names

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
//import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
//import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/firebase_options.dart';

class MyFirebase {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  }

  // Future<String> serverUrl() async {
  // String value = "";
  //  try {
  //     final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  //     await remoteConfig.fetchAndActivate();
  //    await remoteConfig.setConfigSettings(
  //     RemoteConfigSettings(
  //         fetchTimeout: const Duration(minutes: 1),
  //         minimumFetchInterval: const Duration(seconds: 1),
  //       ),
  //    );
  //    value = remoteConfig.getString("url");//url for server in firebase
  //   } catch (e) {
  //     value = "";
  //   }
  //   return value;
  //  }

  //  Future<void> initDynamicLinkes() async {
  //   FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  //   dynamicLinks.onLink.listen((dynamicLinkData) {
  //      final String deepLink=dynamicLinkData.link.toString();

  //   }).onError(handleError)
  // }
}
