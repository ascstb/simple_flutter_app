class AttendeeModel {
  bool subscribed;
  String userId;
  String name;
  String pictureUrl;

  AttendeeModel.fromJsonMap(Map<String, dynamic> json) {
    subscribed = json["subscribed"];
    userId = json["userid"];
    name = json["name"];
    pictureUrl = json["pictureUrl"];
  }

  static List<AttendeeModel> fromJsonList(List<dynamic> jsonList) {
    List<AttendeeModel> result = List();

    jsonList.forEach((json) {
      final AttendeeModel attendee = AttendeeModel.fromJsonMap(json);
      result.add(attendee);
    });

    return result;
  }
}