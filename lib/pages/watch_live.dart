import 'package:agora_live/pages/audience_view.dart';
import 'package:flutter/material.dart';
import 'package:agora_live/data/profile.dart';

class WatchLive extends StatefulWidget {
  @override
  _WatchLiveState createState() => _WatchLiveState();
}

class _WatchLiveState extends State<WatchLive> {
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 13, 25, 1),
      appBar: AppBar(
        title: Text('Watch Live ',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(7, 13, 25, 1),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(image: AssetImage('assets/bg2.jpg'),fit: BoxFit.cover),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ) 
          ),
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Expanded(
                              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: User.users.length,
                  itemBuilder: (BuildContext context, int index){
                    return GestureDetector(
                      onTap: () => Navigator.push(context, 
                      MaterialPageRoute(builder: (_)=>Audience(channelName: User.channelName[index])
                        )
                      ),
                                          child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Container(
                          height: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                      Container(
                                        height: 90,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey,
                                          )
                                        ),
                                        child: Image.asset(User.userImages[index], fit: BoxFit.fill,),
                                      ),
                                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(User.users[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                                          Text('Channel Name: '+User.channelName[index], style: TextStyle(color: Colors.white70),)
                                        ],
                                      )
                                    ],
                                  ),
                                ),

                        ),
                    );
                    },
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}