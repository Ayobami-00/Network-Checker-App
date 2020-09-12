import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'pages/homepage.dart';
import 'services/data_connectiviy_service.dart';
import 'widgets/netork-error-indicator.dart';

void main() {
  runApp(
    App(),
  );
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    OverlaySupportEntry entry;
    DataConnectivityService()
        .connectivityStreamController
        .stream
        .listen((event) {
      print(event);
      if (event == DataConnectionStatus.disconnected) {
        entry = showOverlayNotification((context) {
          return NetworkErrorAnimation();
        }, duration: Duration(hours: 1));
      } else {
        if (entry != null) {
          entry.dismiss();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'Network Checker App',
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
