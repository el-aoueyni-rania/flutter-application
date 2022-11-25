import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo Interactive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _iconbutton = Icon(Icons.favorite_border, color: Colors.white,);
  var _like = false;
  var _displayed = 'HomeSelected';
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return (
    Scaffold(
      appBar: AppBar(
        title: Text('InteractiveApp'),
        backgroundColor: Colors.indigoAccent,
        actions: [
          IconButton(onPressed: _setLike, icon: _iconbutton)
        ],
      ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('$_displayed', style: TextStyle(fontSize: 40)),],)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _setLike,
        backgroundColor: Colors.indigoAccent,
        child: _iconbutton),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon:
                                                     Icon(Icons.home , color: Colors.white),
                                                     label: 'Home'),
                                                     BottomNavigationBarItem(icon:
                                                     Icon(Icons.settings , color: Colors.white),
                                                     label: 'Settings'),
                                                     BottomNavigationBarItem(icon:
                                                     Icon(Icons.account_circle , color: Colors.white),
                                                     label: 'Account')],
                        backgroundColor: Colors.indigoAccent,
                        currentIndex: _currentIndex,
                        onTap: _setDisplayed,
    ),
    )
    );

  }


  void _setLike() {
    setState(() {
      if(_like){
        _like = false;
        _iconbutton = Icon(Icons.favorite_border, color: Colors.white,);
      }
      else{
        _like = true;
        _iconbutton = Icon(Icons.favorite, color: Colors.white,);
      }
    });
  }

  void _setDisplayed(int index) {
    setState(() {
    switch (index){
      case 0:
        _displayed = 'HomeSelected';
        _currentIndex = 0;
        break;
      case 1:
        _displayed = 'SettingSelected';
        _currentIndex = 1;
        break;
      case 2:
        _displayed = 'AccountSelected';
        _currentIndex = 2;
        break;
    }
    });
  }
}
