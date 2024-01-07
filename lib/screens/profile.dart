import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..loadRequest(Uri.parse('https://flutter.dev'));
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: h,
          child: Column(
            children: [
              const CircleAvatar(
                radius: 52,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 47,
                  child: SizedBox(),
                ),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.person_circle, color: Colors.green,),
                title: Text('Fname Lname'),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.phone_fill, color: Colors.green,),
                title: Text('+251 928 667 400'),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.location_solid, color: Colors.red,),
                title: Text('Addis Ababa, Jemo1'),
              ),
              Container(
                width: w,
                height: 500,
                child: WebViewWidget(
                    controller: controller),
              )
            ],
          ),
        ),
      ),
    );
  }
}
