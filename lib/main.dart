import 'package:flutter/material.dart';
import 'package:simple_flutter_app/src/provider/ActivityProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Flutter App',
      home: buildScaffold(),
      debugShowCheckedModeBanner: false,
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Flutter App'),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text("Consume API"),
            onPressed: () async {
              final activityProvider = ActivityProvider();
              String activityId = "5f63a9eae8e85931b1d8bdb8";

              final activityDetails =
                  await activityProvider.getActivityDetails(activityId);

              if (activityDetails == null) {
                print("MyApp_TAG: buildScaffold: activityDetails error");
              } else {
                print(
                    "MyApp_TAG: buildScaffold: activityDetails works: ${activityDetails.title}");
              }
            },
          ),
        ),
      ),
    );
  }
}
