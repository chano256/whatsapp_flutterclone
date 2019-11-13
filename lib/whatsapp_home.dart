import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_flutterclone/src/call_screen.dart';
import 'package:whatsapp_flutterclone/src/camera_screen.dart';
import 'package:whatsapp_flutterclone/src/chat_screen.dart';
import 'package:whatsapp_flutterclone/src/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  @override
  _WhatsAppHomeState createState() => new _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
  with SingleTickerProviderStateMixin {

    TabController _tabController;

    @override
  void initState() {
    super.initState();
    _tabController= new TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Whatsapp"),
        elevation: 0.7,
        bottom: new TabBar(
            controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text: "Chats",),
            new Tab(text: "Status",),
            new Tab(text: "Calls",),
          ],
        ),
        actions: <Widget>[
          new Icon(Icons.search),
          new Padding(padding: const EdgeInsets.symmetric(horizontal: 5.0)),
          new Icon(Icons.more_vert),
        ],
      ),
      body: new TabBarView(
          controller: _tabController,
        children: <Widget>[
          new CameraScreen(),
          new ChatScreen(),
          new StatusScreen(),
          new CallsScreen(),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
          backgroundColor: Theme.of (context).accentColor,
          child: new Icon(
              Icons.message,
              color: Colors.white,
          ),
          onPressed: () => print("open chats"),
      )
    );
  }
}