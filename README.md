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

---

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

### Ui cloning(stateless widget)

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

### Statefull widget

setState를 통해 flutter에게 update 되었음을 알려줌

```dart
import 'package:flutter/material.dart';

enum CalcMethod { plus, minus }

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void handleCounter(CalcMethod method) {
    switch (method) {
      case CalcMethod.plus:
        setState(() {
          counter++;
        });
        break;
      case CalcMethod.minus:
        // modify
        counter--;
        // notify to flutter
        setState(() {});
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 188, 188),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Counter',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            '$counter',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () => handleCounter(CalcMethod.minus),
                icon: const Icon(Icons.indeterminate_check_box),
              ),
              IconButton(
                iconSize: 40,
                onPressed: () => handleCounter(CalcMethod.plus),
                icon: const Icon(Icons.add_box_rounded),
              ),
            ],
          )
        ],
      )),
    ));
  }
}
```

### BuildContext

현재 트리 정보를 알 수 있으며, 부모 트리에 접근가능하다.

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: TextTheme(
                titleLarge: TextStyle(
          fontSize: 40,
          color: Colors.amber.shade200,
        ))),
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 14, 13, 13),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              MyLargeTitle(),
            ],
          )),
        ));
  }
}

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Large Title',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
```

### Lifecylce

```dart
flutter의 생명주기

1. initState()

build를 하기 전에 항상 먼저 실행된다.

대표적으로 API를 불러올 때 사용된다.

2.dispose()

화면에서 사라질 때 실행한다.
```

---

## Toonflix

[api](https://webtoon-crawler.nomadcoders.workers.dev/)

appBar

### Future builder

setState 등을 사용하지 않고 future data를 사용할 수 있다

snapshot은 future의 상태를 나타낸다.

```dart
import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text('Succeeded with data');
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else {
            return const Text('Loading...');
          }
        },
      ),
    );
  }
}
```

### Listview (여러 항목을 나타낼 때 적합)

- basic
  ```dart
  return ListView(
                children: [
                  for (var webtoon in snapshot.data!) Text(webtoon.title)
                ],
              );
  ```
- Listview.builder
  - 보이는 부분만 build (최적화)
  ```dart
  return ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    itemBuilder: (context, index) {
      print(index);
      var webtoon = snapshot.data![index];
      return Text(webtoon.title);
    },
  );
  ```
- Listview.seperator
  - 최적화 + 리스트와 리스트 사이에 구분할 수 있는 widget
  ```dart
  return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  print(index);
                  var webtoon = snapshot.data![index];
                  return Text(webtoon.title);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              );
  ```

### Webtoon card (seperate ListView)

```dart
import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: makeList(snapshot),
                )
              ],
            );
          } else if (snapshot.hasError) {
            return const Text('Something went wrong');
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Container(
              width: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(3, 5),
                      color: Colors.black45,
                    )
                  ]),
              clipBehavior: Clip.hardEdge,
              child: Image.network(webtoon.thumb),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              webtoon.title,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 20,
        );
      },
    );
  }
}
```

### Navigator.push

애니메이션 효과를 통해 다른 페이지로 이동한듯한 느낌을 준다. 실제로는 다른 stateless widget을 보여줄 뿐

```dart
GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detail(
                title: title,
                thumb: thumb,
                id: id,
              ),
							fullscreenDialog: true,
            ));
      },
)
```
