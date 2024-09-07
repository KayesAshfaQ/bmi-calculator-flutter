import 'package:bmi_calculator/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum Imperial { ft, cm }

enum Metric { lbs, kg }

class SettingsController {
  Imperial selectedImperial = Imperial.ft;
  Metric selectedMetric = Metric.kg;

  void setImperial(Imperial imperial) {
    selectedImperial = imperial;
  }

  void setMetric(Metric metric) {
    selectedMetric = metric;
  }

  String getImperial() {
    return selectedImperial.toString().split('.').last.toUpperCase();
  }

  String getMetric() {
    return selectedMetric.toString().split('.').last.toUpperCase();
  }

  // get all imperial units
  List<Imperial> getImperialUnits() {
    return Imperial.values;
  }

  // get all metric units
  List<Metric> getMetricUnits() {
    return Metric.values;
  }

  void showToast(String message) {
    // cancel previous toast if available
    Fluttertoast.cancel();

    // shows new toast
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: kColorBottomContainer,
    );
  }
}
