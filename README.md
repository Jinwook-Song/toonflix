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
