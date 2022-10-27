class DateTimeUtils {
  static String timestampToDateTime(int timestamp) {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final List<String> splitedDate = dateTime.toString().split(":");
    return "${splitedDate[0]}:${splitedDate[1]}";
  }

  static String getTimeFromTimestamp(int timestamp) {
    final DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final String time = dateTime.toString().split(" ")[1];
    final List<String> splitedTime = time.split(":");
    return "${splitedTime[0]}:${splitedTime[1]}";
  }
}
