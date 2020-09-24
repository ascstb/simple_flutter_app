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

    //region Dates
    sDate = json["date"];
    startDate = DateTime.parse(sDate).toLocal();

    sEndDate = json["endDate"];
    endDate = DateTime.parse(sEndDate).toLocal();
    //endregion

    category = CategoryModel.fromJsonMap(json["category"]);

    transportation = json["transportation"];
    backgroundUrl = json["backgroundUrl"];
    iconUrl = json["iconUrl"];
    imageUrl = json["imageUrl"];
    activityUrl = json["activityUrl"];

    attendees = AttendeeModel.fromJsonList(json["attendees"]);
  }
}