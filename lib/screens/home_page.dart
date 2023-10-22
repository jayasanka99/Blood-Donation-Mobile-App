import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
Widget buildCard(BuildContext context, String cardText,String routeName) {
  return GestureDetector(
    onTap: () {
      // Navigate to the "Emergency" screen when the card is tapped
      Navigator.pushNamed(context, routeName);
    },
    child: Container(
      height: 130,
      child: Card(
        color: Color.fromARGB(150, 200, 0, 0),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(),
            // Add image here
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    cardText,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 200, 0, 0),
        leading: const Image(
          image: AssetImage("asset/images/app_icon.png"),
        ),
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app), // Add a logout icon
            onPressed: () async {
              // FirebaseAuth.instance.signOut();
              // Implement the logout functionality here
              await FirebaseAuth.instance.signOut();
              // You can also navigate to the login screen or perform any other actions
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only( top: 5,left: 20,right: 20),
          child: Column(
            children: [
              buildCard(context,"EMERGENCY",'/emergency'),
              buildCard(context,'HELP','/help'),
              buildCard(context,'BLOOD CAMP','/blood_camp'),
              buildCard(context,'REWARDS','/rewards'),
              buildCard(context,'HISTORY','/history'),
            ],
          ),
        ),
      ),
    );
  }
}
