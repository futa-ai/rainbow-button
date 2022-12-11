import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/javascript.dart';
import 'package:url_launcher/url_launcher.dart';

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

const Map<String, List<Color>> _buttonColor = {
  "rainbow": [
    Color(0xffff00ff),
    Color(0xffffff00),
    Color(0xff00ffff),
    Color(0xffff00ff)
  ],
  "black": [Color(0xff696969), Color(0xffA9A9A9), Color(0xffDCDCDC)],
  "brown": [Color(0xff8B4513), Color(0xffDEB887), Color(0xffFAEBD7)],
  "orange": [Color(0xffFF8C00), Color(0xffFFA07A), Color(0xffFFDEAD)],
  "yellow": [Color(0xffFFFF00), Color(0xffF0E68C), Color(0xffFFFFE0)],
  "green": [Color(0xff32CD32), Color(0xff90EE90), Color(0xffF0FFF0)],
  "blue": [Color(0xff0000FF), Color(0xff4169E1), Color(0xff87CEFA)],
  "purple": [Color(0xff9400D3), Color(0xff6A5ACD), Color(0xffE6E6FA)],
  "pink": [Color(0xffFF1493), Color(0xffFF69B4), Color(0xffFFC0CB)],
  "red": [Color(0xffFF0000), Color(0xffF08080), Color(0xffFFE4E1)]
};

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
var _isChecked = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  true,
  true,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false
];
const _tagNames = [
  "h1",
  "h2",
  "h3",
  "h4",
  "h5",
  "h6",
  "p",
  "a",
  "button",
  "ul",
  "ol",
  "img",
  "table",
  "tr",
  "th",
  "section",
  "article",
  "nav",
  "main",
  "footer"
];
var _isOpened = [true, false, false];
var _canTap = true;
List<String> tagName = [];
String colorName = "";
Color _notSelectedColor = const Color(0xffE5E5E5);

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _active = false;
  bool _activeAll = false;
  void _changeSwitch(bool e) {
    e
        ? _isChecked[0] = _isChecked[2] = true
        : _isChecked[0] = _isChecked[2] = false;
    setState(() => _active = !e);
  }

  void _allSwitch(bool e) {
    e
        ? {
            _isOpened = [true, false, false],
            _canTap = true,
          }
        : {
            _isOpened = [false, false, false],
            _canTap = false,
            setData([], 'rainbow'),
            reloadPage(),
          };
    setState(() => _activeAll = !e);
  }

  RadioValue _gValue = RadioValue.RAINBOW;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        width: 350,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 330,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 165,
                      child: SwitchListTile(
                        value: !_activeAll,
                        activeColor: Colors.lightBlueAccent,
                        activeTrackColor: const Color(0xffC1EFFF),
                        inactiveThumbColor: Colors.black38,
                        inactiveTrackColor: _notSelectedColor,
                        title: const Text('OFF/ON'),
                        onChanged: _allSwitch,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:
                      (_canTap) ? const Color(0xffFFF5DB) : _notSelectedColor,
                  boxShadow: (_canTap)
                      ? const [
                          BoxShadow(
                            color: Color(0xffE5E5E5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        (_canTap)
                            ? setState(() {
                                _isOpened[0] = !_isOpened[0];
                                _isOpened[1] = !_isOpened[1];
                              })
                            : null;
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
                              value: !_active,
                              activeColor: Colors.lightBlueAccent,
                              activeTrackColor: const Color(0xffC1EFFF),
                              inactiveThumbColor: Colors.black38,
                              inactiveTrackColor: _notSelectedColor,

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
                        (_canTap)
                            ? setState(() {
                                _isOpened[0] = !_isOpened[0];
                                _isOpened[1] = !_isOpened[1];
                              })
                            : null;
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
                  borderRadius: BorderRadius.circular(10),
                  color:
                      (_canTap) ? const Color(0xffFFF5DB) : _notSelectedColor,
                  boxShadow: (_canTap)
                      ? const [
                          BoxShadow(
                            color: Color(0xffE5E5E5),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(1, 1),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        (_canTap)
                            ? setState(() {
                                _isOpened[0] = !_isOpened[0];
                                _isOpened[1] = !_isOpened[1];
                              })
                            : null;
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
                                SizedBox(
                                  width: 295,
                                  height: 40,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'どのタグを光らせる？',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 290,
                                  child: Column(
                                    children: [
                                      for (var i = 0;
                                          i < _tagNames.length ~/ 3;
                                          i++) ...{
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            for (var j = 0; j < 3; j++) ...{
                                              Checkbox(
                                                checkColor: Colors.redAccent,
                                                activeColor: Colors.transparent,
                                                value: _isChecked[i * 3 + j],
                                                onChanged: (bool? value) {
                                                  _handleCheckbox(i * 3 + j,
                                                      !_isChecked[i * 3 + j]);
                                                },
                                              ),
                                              SizedBox(
                                                width: 53,
                                                child: Text(
                                                  _tagNames[i * 3 + j],
                                                  style: const TextStyle(
                                                    height: 2,
                                                  ),
                                                ),
                                              ),
                                            },
                                          ],
                                        ),
                                      }
                                    ],
                                  ),
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
                        (_canTap)
                            ? setState(() {
                                _isOpened[0] = !_isOpened[0];
                                _isOpened[1] = !_isOpened[1];
                              })
                            : null;
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
              InkWell(
                onTap: () {
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
                  for (var i=0; i < _tagNames.length; i++) {
                    if (_isChecked[i]) tagName.add(_tagNames[i]);
                  }
                  debugPrint('タグは$tagNameです');
                  setData(tagName, colorName);
                  reloadPage();
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                        color: (_canTap) ? null : _notSelectedColor,
                        gradient: (_canTap)
                            ? LinearGradient(
                                colors: () {
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
                                      return [Colors.deepPurple.shade200];
                                  }
                                }(),
                              )
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          '光らせる！',
                          style: TextStyle(
                            fontSize: 16,
                            color: () {
                              switch (_gValue) {
                                case RadioValue.BLUE:
                                case RadioValue.PURPLE:
                                  return Colors.white;
                                default:
                                  return Colors.black;
                              }
                            }(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  width: 350,
                  color: const Color(0xffFFF5DB),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            launchUrl(Uri.parse(
                                'https://futa-ai.notion.site/rainbow-button-f658580513c442da90433a8633b27115'));
                          },
                          icon: const Icon(Icons.help_outline)),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    'https://github.com/futa-ai/rainbow-button'));
                              },
                              icon: Image.network(
                                  'https://cdn.discordapp.com/attachments/1037739356414287956/1051260264168833157/github-mark.png')),
                          IconButton(
                              onPressed: () {
                                launchUrl(
                                    Uri.parse('https://twitter.com/_futa_ai'));
                              },
                              icon: Image.network(
                                  'https://cdn.discordapp.com/attachments/1037739356414287956/1051260264516943943/twitter.png')),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _handleCheckbox(int i, bool value) {
    setState(() {
      _isChecked[i] = value;
    });
  }

  Widget _colorChoiceButton() {
    return Column(
      children: [
        SizedBox(
          width: 295,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '色を選んでね！',
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

  Widget _colorButton(String colorName, RadioValue rainbowValue) {
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
              color: (_gValue != rainbowValue) ? _notSelectedColor : null,
              gradient: (_gValue == rainbowValue)
                  ? LinearGradient(
                      colors: () {
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
                            return [Colors.deepPurple.shade200];
                        }
                      }(),
                    )
                  : null,
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
