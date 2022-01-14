import 'package:flutter/material.dart';
import 'package:xian_test/screens/user_screen.dart';

import 'add_user.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: UserScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => AddUser()));
        },
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
    );
  }
}
