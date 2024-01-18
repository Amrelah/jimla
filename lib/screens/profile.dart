import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jimla/components/profile/tiles.dart';
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
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: w,
                  height: 120.sp,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30.sp),bottomRight: Radius.circular(30.sp))
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0.sp),
                    child: CircleAvatar(
                      radius: 90.sp,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 85.sp,
                        backgroundColor: Colors.green,
                        child: CircleAvatar(
                          radius: 80.sp,
                          child: const SizedBox(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const ProfileTiles(
                iconData: CupertinoIcons.person_circle,
                color: Colors.green,
                text: 'Amrellah Delil'),
            const ProfileTiles(
                iconData: CupertinoIcons.phone_fill,
                color: Colors.green,
                text: '+251 928 667 400'),
            const ProfileTiles(
                iconData: CupertinoIcons.location_solid,
                color: Colors.red,
                text: 'Addis Ababa, Jemo1'),
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
                  MarkerLayer(
                      markers: [
                        Marker(
                            height: 200.sp,
                            width: 200.sp,
                            rotate: true,
                            point: const LatLng(8.954632696144019, 38.68426347116409),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Stack(
                                children: [
                                  Icon(
                                    CupertinoIcons.location_solid,
                                    color: Colors.red,
                                    size: 100.sp,
                                  ),
                                  Positioned(
                                    right: 25.sp,
                                    top: 15.sp,
                                    child: CircleAvatar(
                                      radius: 25.sp,
                                      child: Icon(CupertinoIcons.house_fill, size: 45.sp,),
                                    ),
                                  )
                                ],
                              ),
                            ))
                      ]),
                ],
              ),
            ),
            const ProfileTiles(
                iconData: Icons.logout,
                color: Colors.red,
                text: 'Logout'),
            SizedBox(height: 50.sp,)
          ],
        ),
      ),
    );
  }
}
