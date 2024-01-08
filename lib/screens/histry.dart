import 'package:expandable/expandable.dart';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
          centerTitle: true,
          bottom: const TabBar(
            isScrollable: true,
              padding: EdgeInsets.only(left: 0),
              tabs: [
                Tab(
                  icon: Icon(CupertinoIcons.check_mark_circled, color: Colors.green,),
                  child: Text('Delivered(100)'),
                ),
                Tab(
                  icon: Icon(Icons.delivery_dining, color: Colors.deepOrange,),
                  child: Text('Pending(10)'),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.timer, color: Colors.purple,),
                  child: Text('Scheduled(5)'),
                ),Tab(
                  icon: Icon(CupertinoIcons.clear_circled, color: Colors.pink,),
                  child: Text('Cancelled(4)'),
                ),
              ]),
        ),
        body: TabBarView(
          children: [

            // delivered
            SizedBox(
              height: h,
              child: ListView.separated(
                  itemBuilder: (context, index) => ExpandablePanel(
                    header: const ListTile(
                    leading: Icon(CupertinoIcons.check_mark_circled, color: Colors.green,),
                      title: Text('Jan 6 , 2024'),
                      trailing: Text('1000.00Br'),
                      focusColor: Colors.green,
                      splashColor: Colors.green,
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                          children: [
                            Image.asset(Images.drawer,height: 500,),
                            Text("detail"),
                          ]
                      ),
                    ),
                    collapsed: const SizedBox(),
                  ),
                  separatorBuilder: (context, index) => const Divider(height: 2,color: Colors.black,thickness: 2),
                  itemCount: 20),
            ),

          //   pending
            SizedBox(
              height: h,
              child: ListView.separated(
                  itemBuilder: (context, index) => ExpandablePanel(
                    header: const ListTile(
                      leading: Icon(Icons.delivery_dining, color: Colors.deepOrange,),
                      title: Text('Jan 6 , 2024'),
                      trailing: Text('1000.00Br'),
                      focusColor: Colors.green,
                      splashColor: Colors.green,
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                          children: [
                            Image.asset(Images.drawer,height: 500,),
                            Text("detail"),
                          ]
                      ),
                    ),
                    collapsed: const SizedBox(),
                  ),
                  separatorBuilder: (context, index) => const Divider(height: 2,color: Colors.black,thickness: 2),
                  itemCount: 20),
            ),

          //   scheduled
            SizedBox(
              height: h,
              child: ListView.separated(
                  itemBuilder: (context, index) => ExpandablePanel(
                    header: const ListTile(
                      leading: Icon(CupertinoIcons.timer, color: Colors.purple,),
                      title: Text('Jan 6 , 2024'),
                      trailing: Text('1000.00Br'),
                      focusColor: Colors.green,
                      splashColor: Colors.green,
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                          children: [
                            Image.asset(Images.drawer,height: 500,),
                            Text("detail"),
                          ]
                      ),
                    ),
                    collapsed: const SizedBox(),
                  ),
                  separatorBuilder: (context, index) => const Divider(height: 2,color: Colors.black,thickness: 2),
                  itemCount: 20),
            ),

          //   cancelled
            SizedBox(
              height: h,
              child: ListView.separated(
                  itemBuilder: (context, index) => ExpandablePanel(
                    header: const ListTile(
                      leading: Icon(CupertinoIcons.clear_circled, color: Colors.red,),
                      title: Text('Jan 6 , 2024'),
                      trailing: Text('1000.00Br'),
                      focusColor: Colors.green,
                      splashColor: Colors.green,
                    ),
                    expanded: ExpandableButton(
                      child: Column(
                          children: [
                            Image.asset(Images.drawer,height: 500,),
                            Text("detail"),
                          ]
                      ),
                    ),
                    collapsed: const SizedBox(),
                  ),
                  separatorBuilder: (context, index) => const Divider(height: 2,color: Colors.black,thickness: 2),
                  itemCount: 20),
            )
          ],
        ),
      ),
    );
  }
}