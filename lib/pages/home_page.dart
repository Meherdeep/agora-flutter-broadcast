import 'package:agora_live/pages/start_live.dart';
import 'package:agora_live/pages/watch_live.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 412,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset('assets/bg5.jpg', fit: BoxFit.cover,),
                Center(
                  child: Container(
                    width: 150,
                    child: Align(
                      alignment: Alignment(0, 0.8),
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: onCreateLive,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Go Live ', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                            Icon(Icons.live_tv),
                          ],
                        )),
                    ),
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0,0.9),
                      child: DotsIndicator(
                      dotsCount: 2,
                      position: 0,
                      decorator: DotsDecorator(
                        activeColor: Colors.red,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 412,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset('assets/bg6.jpg', fit: BoxFit.cover,),
                Center(
                  child: Container(
                    width: 170,
                    child: Align(
                      alignment: Alignment(0, 0.8),
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: onJoinLive,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ), 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Watch Live ', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                            Icon(Icons.live_tv),
                          ],
                        )),
                    ),
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment(0,0.9),
                                      child: DotsIndicator(
                      dotsCount: 2,
                      position: 1,
                      decorator: DotsDecorator(
                        activeColor: Colors.red,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )
      
    );
  }
  Future<void> onJoinLive() async{
    await _handleCameraAndMic(Permission.camera);
        await _handleCameraAndMic(Permission.microphone);
    await Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context)=> WatchLive()
                              )
                            );
  }
  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
  Future<void> onCreateLive() async{
    await _handleCameraAndMic(Permission.camera);
        await _handleCameraAndMic(Permission.microphone);
    await Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context)=> GoLive()
                              )
                            );
                            
  }
  
}