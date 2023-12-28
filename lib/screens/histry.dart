import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jimla/path/path_provider.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: h,
          child: const Column(
            children: [
              CircleAvatar(
                radius: 52,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 47,
                  child: SizedBox(),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.person_circle, color: Colors.green,),
                title: Text('Fname Lname'),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.phone_fill, color: Colors.green,),
                title: Text('+251 928 667 400'),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.location_solid, color: Colors.red,),
                title: Text('Addis Ababa, Jemo1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
