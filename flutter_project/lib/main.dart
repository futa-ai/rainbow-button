import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  void _changeSwitch(bool e) => setState(() => _active = e);
  RadioValue _gValue = RadioValue.RAINBOW;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: 350,
        child: Column(
          children: [
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
                if (_isChecked[0]) tagName.add('a');
                if (_isChecked[1]) tagName.add('p');
                if (_isChecked[2]) tagName.add('button');
                debugPrint('タグは$tagNameです');
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
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.BLACK:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.BROWN:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.ORANGE:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.YELLOW:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.GREEN:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.BLUE:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.PURPLE:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.PINK:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
                    case RadioValue.RED:
                      return [
                        Colors.lightBlue.shade200,
                        Colors.yellow.shade200,
                        Colors.deepPurple.shade200
                      ];
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
