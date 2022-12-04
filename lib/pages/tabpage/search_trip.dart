import 'package:client/pages/autho/signup.dart';
import 'package:flutter/material.dart';
import '../../service/auth_service.dart';

class SearchTrip extends StatefulWidget {
  const SearchTrip({Key? key}) : super(key: key);

  @override
  State<SearchTrip> createState() => _RatingPageState();
}

class _RatingPageState extends State<SearchTrip> {
  AuthService authService = AuthService();

  void ifItemSelectedDo(int value) {
    if (value == 0) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) =>  SignUpPage()));
    }
  }

  PopupMenuItem createItemMenu(String title, IconData iconData, int valeur) {
    return PopupMenuItem(
      value: valeur,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          Text(title),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[600],
          leading: const Icon(Icons.account_circle_rounded ,),
          title: const Text('The trips'),
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                ifItemSelectedDo(value as int);
              },
              itemBuilder: (ctx) => [
                createItemMenu('Exit', Icons.exit_to_app, 0),
              ],
            )
          ],
          automaticallyImplyLeading: false, // simple as that!
          centerTitle: true, // like this!
        ),
        body: const Center(
          child: Text("Reservation Page"),
        ));
  }
}
