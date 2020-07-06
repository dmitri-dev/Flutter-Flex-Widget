import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyScreen('Test1', Test1(), Test2.routeName),
      routes: {
        Test2.routeName: (_) => MyScreen('Test2', Test2(), Test3.routeName),
        Test3.routeName: (_) => MyScreen('Test3', Test3(), Test4.routeName),
        Test4.routeName: (_) => MyScreen('Test4', Test4(), Test5.routeName),
        Test5.routeName: (_) => MyScreen('Test5', Test5(), Test6.routeName),
        Test6.routeName: (_) => MyScreen('Test6', Test6(), Test7.routeName),
        Test7.routeName: (_) => MyScreen('Test7', Test7(), '/'),
      },
    );
  }
}

class MyScreen extends StatelessWidget {
  final String title;
  final Widget body;
  final String path;

  MyScreen(
    this.title,
    this.body,
    this.path,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () => Navigator.of(context).pushNamed(
              path,
            ),
          ),
          SizedBox(
            width: 50,
          ),
        ],
      ),
      body: body,
    );
  }
}

class FlutterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.blue,
        ),
      ),
      child: Image.network(
          'data:image/png;base64,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'),
    );
  }
}
/*
class Test1 extends StatelessWidget {
  static const routeName = 'test1';

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(child: FlutterIcon()),
        Expanded(child: FlutterIcon()),Expanded(child: FlutterIcon()),
      ],
    );
  }
}*/

class Test1 extends StatelessWidget {
  static const routeName = 'test1';

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.cover,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          FlutterIcon(),
          FlutterIcon(),
          FlutterIcon(),
          FlutterIcon(),
        ],
      ),
    );
  }
}

class Test2 extends StatelessWidget {
  static const routeName = 'test2';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Flexible(
            flex: 1,
            child: FlutterIcon(),
          ),
          Flexible(
            flex: 2,
            child: FlutterIcon(),
          ),
          Flexible(
            flex: 8,
            child: FlutterIcon(),
          )
        ],
      ),
    );
  }
}

class Test3 extends StatelessWidget {
  static const routeName = 'test3';

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 1,
          child: FlutterIcon(),
        ),
        Expanded(
          flex: 2,
          child: FlutterIcon(),
        ),
        Expanded(
          flex: 4,
          child: FlutterIcon(),
        ),
      ],
    );
  }
}

class Test4 extends StatelessWidget {
  static const routeName = 'test4';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Flex(
      direction: screenSize.width < 750 ? Axis.horizontal : Axis.vertical,
      children: [
        Row(
          children: [
            FlutterIcon(),
            FlutterIcon(),
            FlutterIcon(),
          ],
        ),
        Column(
          children: [
            FlutterIcon(),
            FlutterIcon(),
            FlutterIcon(),
          ],
        ),
      ],
    );
  }
}

class Test5 extends StatelessWidget {
  static const routeName = 'test5';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return FittedBox(
      fit: BoxFit.contain,
      child: Flex(
        direction: screenSize.width < 750 ? Axis.horizontal : Axis.vertical,
        children: [
          Column(
            children: [
              FlutterIcon(),
              FlutterIcon(),
              FlutterIcon(),
            ],
          ),
          Row(
            children: [
              FlutterIcon(),
              FlutterIcon(),
              FlutterIcon(),
            ],
          ),
        ],
      ),
    );
  }
}

class DoubleFlutterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Flex(
      direction: screenSize.width < 750 ? Axis.horizontal : Axis.vertical,
      children: [
        FlutterIcon(),
        FlutterIcon(),
      ],
    );
  }
}

/*class DoubleFlutterIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Flex(
      direction: screenSize.width < 750 ? Axis.horizontal : Axis.vertical,
      children: [
        SizedBox(
          height: screenSize.width < 750
              ? screenSize.height / 4
              : screenSize.height / 4,
          width: screenSize.width < 750
              ? screenSize.width / 4
              : screenSize.width / 4,
          child: FlutterIcon(),
        ),
        SizedBox(
          height: screenSize.width < 750
              ? screenSize.height / 4
              : screenSize.height / 4,
          width: screenSize.width < 750
              ? screenSize.width / 4
              : screenSize.width / 4,
          child: FlutterIcon(),
        ),
      ],
    );
  }
}*/

class Test6 extends StatelessWidget {
  static const routeName = 'test6';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height / 50,
        horizontal: screenSize.width / 50,
      ),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
//          mainAxisSpacing: screenSize.height / 5,
//          crossAxisSpacing: screenSize.width / 5,
//          childAspectRatio: screenSize.width / screenSize.height,
        ),
        children: [
          FittedBox(
            fit: BoxFit.contain,
            child: DoubleFlutterIcon(),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: DoubleFlutterIcon(),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: DoubleFlutterIcon(),
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: DoubleFlutterIcon(),
          ),
        ],
      ),
    );
  }
}

/*class QuadrupleIcon extends StatelessWidget {
  final String imageUrl1 =
      'https://i.pinimg.com/originals/ce/5f/53/ce5f53437e291c48705428721406985c.jpg';
  final String imageUrl2 =
      'https://www.shortlist.com/media/images/2019/05/20-cartoon-characters-that-are-cooler-than-you-2-1556694961-mtQk-column-width-inline.jpg';
  final String imageUrl3 =
      'https://upload.wikimedia.org/wikipedia/en/2/2f/Jerry_Mouse.png';
  final String imageUrl4 =
      'https://www.shortlist.com/media/images/2019/05/20-cartoon-characters-that-are-cooler-than-you-7-1556694964-63RZ-column-width-inline.jpg';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Flex(
      direction: screenSize.width < 750 ? Axis.horizontal : Axis.vertical,
      children: [
        Flex(
          direction: screenSize.width < 750 ? Axis.vertical : Axis.horizontal,
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Image.network(imageUrl1)),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Image.network(imageUrl2)),
          ],
        ),
        Flex(
          direction: screenSize.width < 750 ? Axis.vertical : Axis.horizontal,
          children: [
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Image.network(imageUrl3)),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue,
                  ),
                ),
                child: Image.network(imageUrl4)),
          ],
        ),
      ],
    );
  }
}*/

class QuadrupleIcon extends StatelessWidget {
  final String imageUrl1 =
      'https://i.pinimg.com/originals/ce/5f/53/ce5f53437e291c48705428721406985c.jpg';
  final String imageUrl2 =
      'https://www.shortlist.com/media/images/2019/05/20-cartoon-characters-that-are-cooler-than-you-2-1556694961-mtQk-column-width-inline.jpg';
  final String imageUrl3 =
      'https://upload.wikimedia.org/wikipedia/en/2/2f/Jerry_Mouse.png';
  final String imageUrl4 =
      'https://www.shortlist.com/media/images/2019/05/20-cartoon-characters-that-are-cooler-than-you-7-1556694964-63RZ-column-width-inline.jpg';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Flex(
      direction: screenSize.width < 750 ? Axis.horizontal : Axis.vertical,
      children: [
        Flex(
          direction: screenSize.width < 750 ? Axis.vertical : Axis.horizontal,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                ),
              ),
              child: SizedBox(
                  height: screenSize.height / 2,
                  width: screenSize.width / 2,
                  child: Image.network(imageUrl1)),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                ),
              ),
              child: SizedBox(
                  height: screenSize.height / 2,
                  width: screenSize.width / 2,
                  child: Image.network(imageUrl2)),
            ),
          ],
        ),
        Flex(
          direction: screenSize.width < 750 ? Axis.vertical : Axis.horizontal,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                ),
              ),
              child: SizedBox(
                  height: screenSize.height / 2,
                  width: screenSize.width / 2,
                  child: Image.network(imageUrl3)),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.blue,
                ),
              ),
              child: SizedBox(
                  height: screenSize.height / 2,
                  width: screenSize.width / 2,
                  child: Image.network(imageUrl4)),
            ),
          ],
        ),
      ],
    );
  }
}

class Test7 extends StatelessWidget {
  static const routeName = 'test7';

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    var screenSize = MediaQuery.of(context).size;
    var appBarHeight = Scaffold.of(context).appBarMaxHeight;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height / 50,
        horizontal: screenSize.width / 50,
      ),
      child: SizedBox(
//        height: (screenSize.height - appBarHeight) / 2,
//        width: screenSize.width / 2,
        child: Center(
          child: GridView(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: screenSize.height / 10,
              crossAxisSpacing: screenSize.width / 10,
              childAspectRatio:
                  (screenSize.width) / (screenSize.height - appBarHeight),
            ),
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: QuadrupleIcon(),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: QuadrupleIcon(),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: QuadrupleIcon(),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: QuadrupleIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
