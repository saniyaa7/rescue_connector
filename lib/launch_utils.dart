// launch_utils.dart
import 'package:url_launcher/url_launcher.dart';

class LaunchUtils {
  static Future<void> makePhoneCall(String phoneNumber) async {
    final url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
