import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_flutter_app/src/model/ActivityModel.dart';

class ActivityProvider {
  String _serverUrl = "dev.api.engage360.evacompute.com:3000";
  String _path = "api/v1/activities/activities/";
  Map<String, String> _headers = {
    "X-Access-Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkZXZpY2VJZCI6ImFiMzcwMTM0M2QzY2FiYzYiLCJleHBTZXNzaW9uIjoxNjI0NTc2MTIzLCJleHBpcmVzSW4iOjE1OTU2MzIxMjMsImlhdCI6MTU5MzA0MDEyMywiZXhwIjozMTg4NjcyMjQ2fQ.uRc1WptIK_kzvagsGovgkdpvX3CIr4lMoq6FBj49aLg",
    "CommunityId": "262580da-6202-4bde-91c9-6e26604ad2f8",
    "UserId": "5ed01dea3be49948602dd10c"
  };

  Future<ActivityModel> _getActivityDetailsHttpResponse(Uri uri) async {
    final response = await http.get(uri, headers: _headers);
    final rawJson = jsonDecode(response.body);
    ActivityModel result = ActivityModel.fromJsonMap(rawJson);

    return result;
  }

  Future<ActivityModel> getActivityDetails(String activityId) async {
    Uri _uri = Uri.http(_serverUrl, _path + activityId);
    return await _getActivityDetailsHttpResponse(_uri);
  }
}