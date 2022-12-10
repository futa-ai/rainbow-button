import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/javascript.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'rainbow button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

enum RadioValue {
  RAINBOW,
  BLACK,
  BROWN,
  ORANGE,
  YELLOW,
  GREEN,
  BLUE,
  PURPLE,
  PINK,
  RED
}
var _isChecked = List.filled(3, false);
var _isOpened = [true, false, false];
List<String> tagName = [];
String colorName = "";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _active = false;
  void _changeSwitch(bool e) {
    e ? _isChecked[0] = _isChecked[2] = true :  _isChecked[0] = _isChecked[2] = false;
    setState(() => _active = e);
  }
  RadioValue _gValue = RadioValue.RAINBOW;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: 350,
        child: Column(
          children: [
            const SizedBox(height: 10),

            Container(
              width: 330,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isOpened[0] = !_isOpened[0];
                        _isOpened[1] = !_isOpened[1];
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              '基本設定',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  () {
                    if (_isOpened[0]) {
                      return Column(
                        children: [
                          SwitchListTile(
                            value: _active,
                            activeColor: Colors.orange,
                            activeTrackColor: Colors.red,
                            inactiveThumbColor: Colors.blue,
                            inactiveTrackColor: Colors.grey,

                            /// アイコンを付けるならここ
                            // secondary: new Icon(
                            //   Icons.thumb_up,
                            //   color: _active ? Colors.orange[700] : Colors.grey[500],
                            //   size: 50.0,
                            // ),
                            title: const Text('ボタンを光らせる？'),
                            onChanged: _changeSwitch,
                          ),
                          const SizedBox(height: 10),
                          _colorChoiceButton(),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isOpened[0] = !_isOpened[0];
                        _isOpened[1] = !_isOpened[1];
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 330,
                          child: Icon(
                            (_isOpened[0])
                                ? Icons.expand_less
                                : Icons.expand_more,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: 330,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white70,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isOpened[0] = !_isOpened[0];
                        _isOpened[1] = !_isOpened[1];
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        SizedBox(
                          height: 30,
                          child: Center(
                            child: Text(
                              'カスタム設定',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                      () {
                    if (_isOpened[1]) {
                      return Column(
                        children: [
                          Column(
                            children: [
                              const Text('どのタグを光らせる？'),
                              Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.blue,
                                    value: _isChecked[0],
                                    onChanged: (bool? value) {
                                      _handleCheckbox(0, !_isChecked[0]);
                                    },
                                  ),
                                  const Text('a'),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.blue,
                                    value: _isChecked[1],
                                    onChanged: (bool? value) {
                                      _handleCheckbox(1, !_isChecked[1]);
                                    },
                                  ),
                                  const Text('p'),
                                  Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Colors.blue,
                                    value: _isChecked[2],
                                    onChanged: (bool? value) {
                                      _handleCheckbox(2, !_isChecked[2]);
                                    },
                                  ),
                                  const Text('button'),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          _colorChoiceButton(),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isOpened[0] = !_isOpened[0];
                        _isOpened[1] = !_isOpened[1];
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 330,
                          child: Icon(
                            (_isOpened[1])
                                ? Icons.expand_less
                                : Icons.expand_more,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                switch (_gValue) {
                  case RadioValue.RAINBOW:
                    colorName = "rainbow";
                    break;
                  case RadioValue.BLACK:
                    colorName = "black";
                    break;
                  case RadioValue.BROWN:
                    colorName = "brown";
                    break;
                  case RadioValue.ORANGE:
                    colorName = "orange";
                    break;
                  case RadioValue.YELLOW:
                    colorName = "yellow";
                    break;
                  case RadioValue.GREEN:
                    colorName = "green";
                    break;
                  case RadioValue.BLUE:
                    colorName = "blue";
                    break;
                  case RadioValue.PURPLE:
                    colorName = "purple";
                    break;
                  case RadioValue.PINK:
                    colorName = "pink";
                    break;
                  case RadioValue.RED:
                    colorName = "red";
                    break;
                  default:
                    debugPrint('【異常】： switch文の引数になりえないデータです。');
                    break;
                }
                debugPrint('色は$colorNameです');
                tagName = [];
                if(_isChecked[0]) tagName.add('a');
                if(_isChecked[1]) tagName.add('p');
                if(_isChecked[2]) tagName.add('button');
                debugPrint('タグは$tagNameです');
                setData(tagName, colorName);
                reloadPage();
                // changeColor();
                // await Future.delayed(const Duration(seconds: 2));
              },
              child: const Text('光らせる！'),
            )
          ],
        ),
      ),
    );
  }

  void _handleCheckbox(int i, bool value) {
    setState(() {
      _isChecked[i] = value;
    });
  }

  Widget _colorChoiceButton(){
    return Column(
      children: [
        SizedBox(
          width: 295,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('色を選んでね！',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 290,
          child: Column(
            children: [
              Row(
                children: [
                  _colorButton('Rainbow', RadioValue.RAINBOW),
                  const SizedBox(width: 10),
                  _colorButton('Black', RadioValue.BLACK),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _colorButton('Brown', RadioValue.BROWN),
                  const SizedBox(width: 10),
                  _colorButton('Orange', RadioValue.ORANGE),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _colorButton('Yellow', RadioValue.YELLOW),
                  const SizedBox(width: 10),
                  _colorButton('Green', RadioValue.GREEN),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _colorButton('Blue', RadioValue.BLUE),
                  const SizedBox(width: 10),
                  _colorButton('Purple', RadioValue.PURPLE),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _colorButton('Pink', RadioValue.PINK),
                  const SizedBox(width: 10),
                  _colorButton('Red', RadioValue.RED),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }

  Widget _colorButton(String colorName, RadioValue rainbowValue){
    const Map<String, List<Color>> _buttonColor = {
      "rainbow": [Color(0xffff00ff), Color(0xffffff00), Color(0xff00ffff), Color(0xffff00ff)],
      "black":   [Color(0xff696969), Color(0xffA9A9A9), Color(0xffDCDCDC)],
      "brown":   [Color(0xff8B4513), Color(0xffDEB887), Color(0xffFAEBD7)],
      "orange":  [Color(0xffFF8C00), Color(0xffFFA07A), Color(0xffFFDEAD)],
      "yellow":  [Color(0xffFFFF00), Color(0xffF0E68C), Color(0xffFFFFE0)],
      "green":   [Color(0xff32CD32), Color(0xff90EE90), Color(0xffF0FFF0)],
      "blue":    [Color(0xff0000FF), Color(0xff4169E1), Color(0xff87CEFA)],
      "purple":  [Color(0xff9400D3), Color(0xff6A5ACD), Color(0xffE6E6FA)],
      "pink":    [Color(0xffFF1493), Color(0xffFF69B4), Color(0xffFFC0CB)],
      "red":     [Color(0xffFF0000), Color(0xffF08080), Color(0xffFFE4E1)]
    };
    return InkWell(
      onTap: () {
        setState(() {
          _gValue = rainbowValue;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40,
            width: 140,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: (_gValue != rainbowValue) ? Colors.grey : null,
              gradient: (_gValue == rainbowValue) ?
                LinearGradient(
                  colors:
                (){
                  switch (_gValue) {
                    case RadioValue.RAINBOW:
                      return _buttonColor['rainbow']!;
                    case RadioValue.BLACK:
                      return _buttonColor['black']!;
                    case RadioValue.BROWN:
                      return _buttonColor['brown']!;
                    case RadioValue.ORANGE:
                      return _buttonColor['orange']!;
                    case RadioValue.YELLOW:
                      return _buttonColor['yellow']!;
                    case RadioValue.GREEN:
                      return _buttonColor['green']!;
                    case RadioValue.BLUE:
                      return _buttonColor['blue']!;
                    case RadioValue.PURPLE:
                      return _buttonColor['purple']!;
                    case RadioValue.PINK:
                      return _buttonColor['pink']!;
                    case RadioValue.RED:
                      return _buttonColor['red']!;
                    default:
                      return [
                        Colors.deepPurple.shade200
                      ];
                  }
                }(),
                ) : null,
            ),
            child: Center(
              child: Text(
                colorName,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
