import 'package:js/js.dart';

///https://core.telegram.org/bots/webapps#webappchat
@JS()
class WebAppChat {
  external int get id;
  external String get photo_url;
  external String get type;
  external String get title;
  external String get username;
}
