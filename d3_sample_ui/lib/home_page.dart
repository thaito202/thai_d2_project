import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final box = Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.lightBlueAccent,
      ),
    );
    final box2 = Container(
      width: 150,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.lightBlueAccent,
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
            color: Colors.amberAccent,
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[100],
          child: Center(child: Text('Drawer')),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8),
            padding: EdgeInsets.all(8),
            color: Colors.deepPurple,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // box,
                Expanded(
                  flex: 3,
                  child: box,
                ),
                const SizedBox(width: 8),
                Expanded(child: box),
                const SizedBox(width: 8),
                Expanded(child: box),
                const SizedBox(width: 8),
                Expanded(flex: 2, child: box),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            color: Colors.orangeAccent,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 10,
              verticalDirection: VerticalDirection.up,
              children: [
                box2,
                box,
                box2,
                box,
                box2,
                box,
                box,
              ],
            ),
          ),
          Flexible(flex: 1, child: box),
          // const SizedBox(height: 8),
          Flexible(flex: 4, child: box),
          // Expanded(child: box),
          // Expanded(child: box),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('+'),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurpleAccent.shade200,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.white,
        // fixedColor: Colors.amberAccent,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            label: 'Home',
            icon: Icon(CupertinoIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(CupertinoIcons.person),
          ),
        ],
      ),
    );
  }
}
