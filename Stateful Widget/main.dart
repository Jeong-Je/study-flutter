import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _ApptState();
}

class _ApptState extends State<App> {
  int counter = 0;

  bool showTitle = true;

  void onClicked() {
    setState(() {
      counter++;
    });
  }

  void toggleTitle() {
    setState(() => showTitle = !showTitle);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
          backgroundColor: const Color(0xFFF4EDDB),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showTitle ? const MyLargeTitle() : const Text('nothing'),
                    IconButton(
                        onPressed: toggleTitle,
                        icon: const Icon(Icons.remove_red_eye)),
                  ],
                ),
                Text(
                  '$counter',
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
                IconButton(
                    iconSize: 40,
                    onPressed: onClicked,
                    icon: const Icon(Icons.add_box_rounded))
              ],
            ),
          )),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    super.initState();
    print('initState!'); // 1등 - 제일 처음 실행
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose!'); // 3등 - 위젯이 사라질 때 실행
  }

  @override
  Widget build(BuildContext context) {
    print('build !'); //2등 - build시에 실행
    return Text(
      'Click Me !',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge!.color,
      ),
    );
  }
}
