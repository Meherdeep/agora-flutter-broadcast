import 'package:flutter/material.dart';

class BroadcasterView extends StatefulWidget {
  final String channelName;
  BroadcasterView(this.channelName);
  @override
  _BroadcasterViewState createState() => _BroadcasterViewState();
}

class _BroadcasterViewState extends State<BroadcasterView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.green,
      child: Text(widget.channelName, style: TextStyle(color: Colors.white)),
      
    );
  }
}