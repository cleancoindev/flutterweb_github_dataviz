import 'package:intl/intl.dart';

class WeekLabel {
  int weekNum;
  String label;

  WeekLabel(this.weekNum, this.label);

  WeekLabel.forDate(DateTime date, String label) {
    this.label = label;
    int year = getYear(date);
    int weekOfYearNum = getWeekNumber(date);
    this.weekNum = 9 + ((year - 2015) * 52) + weekOfYearNum;
  }

  int getYear(DateTime date) {
    return int.parse(DateFormat("y").format(date));
  }

  int getWeekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    return ((dayOfYear - date.weekday + 10) / 7).floor();
  }


}

void main() {
  var weekLabel = WeekLabel.forDate(new DateTime(2019, 2, 26), "Testing");
  print("${weekLabel.weekNum}");

}
