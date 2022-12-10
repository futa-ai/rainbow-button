@JS()
library index;

import 'package:js/js.dart';

@JS('changeColor')
external void changeColor(List<String> tagNames, String colorName);