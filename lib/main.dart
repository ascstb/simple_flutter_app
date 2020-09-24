import 'package:flutter/material.dart';
import 'package:simple_flutter_app/src/model/ActivityModel.dart';
import 'package:simple_flutter_app/src/provider/ActivityProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activityProvider = ActivityProvider();
    String activityId = "5f63a9eae8e85931b1d8bdb8";

    return MaterialApp(
      title: 'Simple Flutter App',
      home: FutureBuilder(
        future: activityProvider.getActivityDetails(activityId),
        builder: (BuildContext context, AsyncSnapshot<ActivityModel> snapshot) {
          if (snapshot == null || !snapshot.hasData) {
            return buildEmptyContainer();
          } else {
            return buildScaffold(context);
          }
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Container buildEmptyContainer() {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Simple Flutter App'),
        ),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context) {
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
                showCustomDialog(context, "Info", "No data found");
                print("MyApp_TAG: buildScaffold: activityDetails error");
              } else {
                showCustomDialog(context, activityDetails.title, activityDetails.description);
                print(
                    "MyApp_TAG: buildScaffold: activityDetails works: ${activityDetails.title}");
              }
            },
          ),
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context, String title, String description) {
    showDialog(context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      )
    );
  }
}
