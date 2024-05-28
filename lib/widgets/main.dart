import 'package:flutter/material.dart';
import 'package:library_manager/widgets/members_widget.dart';
import 'about.dart';
import 'library_widget.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.all(20.0),
                child:Image(image: NetworkImage("https://th.bing.com/th/id/OIP.425-1YRYgmBfHmOxeT5bOQAAAA?rs=1&pid=ImgDetMain"))
            ),
            Text(
              'Welcome to Amine\'s Library\n'
                  'You\'ll find all the books you need here.\n'
                  'Click on the button below to view the list of available books.\n',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LibraryWidget()));
        },
        tooltip: 'Show books',
        child: const Icon(Icons.search_rounded),
      ), // This trai
      drawer: CustomDrawer()// ling comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(constraints: const BoxConstraints(maxHeight: 100, maxWidth: 100),child: const Image(image: NetworkImage('https://avatars.githubusercontent.com/u/151735046?v=4'),),),
                const Text('Amine Badri')
              ],
            ),
          ),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MyApp()));
            },

          ),
          ListTile(
            title: const Text('Books'),
            leading: const Icon(Icons.book),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => LibraryWidget()));
            },
          ),
          ListTile(
            title: const Text('Members'),
            leading: const Icon(Icons.people),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MembersWidget()));
            },
          ),
          ListTile(
            title: const Text('About'),
            leading: const Icon(Icons.info),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AboutScreen()));
            },
          ),
        ],
      ),
    );
  }
}


