import 'package:simple_flutter_app/src/model/AttendeeModel.dart';
import 'package:simple_flutter_app/src/model/CategoryModel.dart';

class ActivityModel {
  String id;
  String title;
  String description;
  String location;

  //region dates
  String sDate;
  DateTime startDate;

  String sEndDate;
  DateTime endDate;
  //endregion

  CategoryModel category;

  bool transportation;
  String activityUrl;
  String backgroundUrl;
  String iconUrl;
  String imageUrl;

  List<AttendeeModel> attendees;

  ActivityModel.fromJsonMap(Map<String, dynamic> json) {
    id = json["_id"];
    title = json["title"];
    description = json["description"];
    location = json["location"];
    sDate = json["date"];
    sEndDate = json["endDate"];

    transportation = json["transportation"];
    backgroundUrl = json["backgroundUrl"];
    iconUrl = json["iconUrl"];
    imageUrl = json["imageUrl"];
  }
}