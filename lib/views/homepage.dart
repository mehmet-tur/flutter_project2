import 'package:flutter/material.dart';
import 'package:flutter_project2/utils/colors.dart';
import 'package:flutter_project2/views/create_event_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: whiteColor,
                size: 40,
              ))
        ],
      ),
      body: const Text(
        "Welcome user",
        style: TextStyle(
            color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateEventPage()));
        },
        backgroundColor: blueColor,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
