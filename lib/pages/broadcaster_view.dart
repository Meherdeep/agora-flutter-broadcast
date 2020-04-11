import 'package:agora_live/widgets/broadcaster.dart';
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
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Broadcaster(widget.channelName),
          )
        ],
      ),
      
    );
  }
}