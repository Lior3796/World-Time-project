DateTime formatTime(Map data) {
  String dateTime = data["utc_datetime"];
  String offset = data["utc_offset"];
  DateTime now = DateTime.parse(dateTime);
  if (offset.substring(0, 1) == "-") {
    now = now.subtract(Duration(
      hours: int.parse(offset.substring(1, 3)),
    ));
  } else {
    now = now.add(Duration(
      hours: int.parse(offset.substring(1, 3)),
    ));
  }
  return now;
}
