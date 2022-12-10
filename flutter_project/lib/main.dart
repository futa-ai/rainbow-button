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
              // height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      debugPrint('押した');
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
                              'まずはここから',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // (_isOpened[0]) ?
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
                            subtitle: const Text('サブタイトル'),
                            onChanged: _changeSwitch,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Rainbow'),
                                  value: RadioValue.RAINBOW,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Black'),
                                  value: RadioValue.BLACK,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Brown'),
                                  value: RadioValue.BROWN,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Orange'),
                                  value: RadioValue.ORANGE,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Yellow'),
                                  value: RadioValue.YELLOW,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Green'),
                                  value: RadioValue.GREEN,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Blue'),
                                  value: RadioValue.BLUE,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Purple'),
                                  value: RadioValue.PURPLE,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Pink'),
                                  value: RadioValue.PINK,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: RadioListTile(
                                  title: const Text('Red'),
                                  value: RadioValue.RED,
                                  groupValue: _gValue,
                                  onChanged: (value) => _onRadioSelected(value),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  }(),
                  InkWell(
                    onTap: () {
                      debugPrint('押した');
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

  _onRadioSelected(value) {
    setState(() {
      _gValue = value;
    });
  }

  void _handleCheckbox(int i, bool value) {
    setState(() {
      _isChecked[i] = value;
    });
  }
}
