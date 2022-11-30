# toonflix

| 프로젝트 기간 | 22.11.27 ~   |
| ------------- | ------------ |
| 프로젝트 목적 | Flutter tour |
| Github        |              |
| Docs          |              |

---

`brew install --cask flutter`

- check
  `flutter doctor`

flutter create <project_name>

## Widget

everything is widget

MaterialApp → Google Style

CupertinoApp → Apple Style

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Flutter',
            ),
          ),
          body: const Center(
            child: Text(
              'Hello world',
            ),
          )),
    );
  }
}
```

### Ui cloning

[reference](http://dribbble.com/shots/19858341-Finnancial-Mobile-IOS-App)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double horizontal2 = 20;
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal2,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Hey, Selena',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
```
