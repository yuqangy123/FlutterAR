import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'MainPageView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: BottomNavigationBarWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //new worldRandoms(),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display4,
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class worldRandoms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _worldRandomState();
  }
}

class _worldRandomState extends State<worldRandoms> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 20);
  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //final worldpair = new WordPair.random();
    //return new Text("worldRandoms statefulWidget state:" + worldpair.asPascalCase);
    return Scaffold(
        appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("listview"),
          actions: <Widget>[new IconButton(icon: Icon(Icons.list), onPressed:_pushSaved ,)],
    ),
    body: buildSuggestions()
    );
  }

  void _pushSaved()
  {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context){
        final titles = _saved.map((pair){
          return new ListTile(
            title: new Text(pair.asPascalCase, style: _biggerFont),
          );
        });
        print(titles.length);

        final divided = ListTile.divideTiles(
          context: context,
          tiles: titles,
        ).toList();

        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Saved Suggestions'),
          ),
          body: new ListView(children: divided),
        );
      })
    );
  }

  Widget buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd)
          return new Divider();
        int index = (i ~/ 2);
        if(index >= _suggestions.length)
          _suggestions.addAll(generateWordPairs().take(10));
        return _buildRow(_suggestions[index]);
      });
  }

  Widget _buildRow(WordPair word)
  {
    bool isSaved = _saved.contains(word);
    return new ListTile(
        title: new Text(word.asPascalCase, style: _biggerFont),
        trailing: new Icon(isSaved ? Icons.favorite : Icons.favorite_border,
        color: isSaved ? Colors.deepOrange : null,),
        onTap: (){
          setState(() {
            if(isSaved)
              _saved.remove(word);
            else
              _saved.add(word);
          });
        },
    );
  }
}

class BottomNavigationBarWidget extends StatefulWidget{
  BottomNavigationBarWidget({Key key}) : super(key: key);
  BottomNavigationBarWidgetState createState() => new BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Image.asset(
      // 图片路径
      'places/india_chennai_flower_market.png',
      // 包名
      package: 'flutter_gallery_assets',
    ),
    /*Scaffold(
      backgroundColor: Colors.white,
    ),*/
    SizedBox(
      child: Card(
        elevation: 20,
        child: Container(
          //margin: const EdgeInsets.all(10.0),
          //color: Colors.grey,
          width: 200.0,
          height: 200.0,

        ),
      ),
    ),

    GridListDemo(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(items: const<BottomNavigationBarItem>[
        //ImageIcon: 自定义图形图标, 用于图片绘制，不可交互，与Icon不同之处在于可用ImageProvider自定义图标，一定用png，自适应图片size，所以尽量注意图片size
        BottomNavigationBarItem(icon: ImageIcon(AssetImage("icons/Switch_camera.png")),  title: Text('AR')),
        BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('巴士')),
        BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('School')),
      ],
      currentIndex:_selectedIndex,

      backgroundColor: Colors.black26,
          selectedIconTheme: IconThemeData(opacity: 1),
          unselectedIconTheme: IconThemeData(opacity: 0.22),
      onTap: (int index){
        setState(() {
          _selectedIndex = index;
        });
      }),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

}