@JS()
library index;

import 'package:js/js.dart';

@JS('setData')
external void setData(List<String> tagNames, String colorName);

@JS('reloadPage')
external void reloadPage();

@JS('changeColor')
external void changeColor();
