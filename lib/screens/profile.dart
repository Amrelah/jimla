import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
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
              // SizedBox(
              //   width: w,
              //   height: 500,
              //   child: WebViewWidget(
              //       controller: controller),
              // ),
              SizedBox(
                height: h/2,
                width: w,
                child: FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(8.954632696144019, 38.68426347116409),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    const MarkerLayer(
                        markers: [
                          Marker(
                            height: 200,
                              width: 200,
                              rotate: true,
                              point: LatLng(8.954632696144019, 38.68426347116409),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Stack(
                                  children: [
                                    Icon(
                                      CupertinoIcons.location_solid,
                                      color: Colors.red,
                                      size: 100,
                                    ),
                                    Positioned(
                                      right: 25,
                                      top: 15,
                                      child: CircleAvatar(
                                        radius: 25,
                                        child: Icon(CupertinoIcons.house_fill, size: 45,),
                                      ),
                                    )
                                  ],
                                ),
                              ))
                        ]),
                  ],
                ),
              ),
              const ListTile(
                leading: Icon(Icons.logout, color: Colors.red,),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
