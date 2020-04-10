import 'package:agora_live/data/profile.dart';
import 'package:agora_live/pages/broadcaster_view.dart';
import 'package:flutter/material.dart';

class GoLive extends StatefulWidget {
  @override
  _GoLiveState createState() => _GoLiveState();
}

class _GoLiveState extends State<GoLive> {
  final userNameController = TextEditingController();
  final channelNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 13, 25, 1),
      appBar: AppBar(
        title: Text('Go Live ',style: TextStyle(color: Colors.white),),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Ready to go live?', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                Container(
                  width: 250,
                  child: TextFormField(
                    controller: userNameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Meher',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                  ),),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 7)),
                Container(
                  width: 250,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: channelNameController,
                    decoration: InputDecoration(
                    labelText: 'Channel Name',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'test',
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey)
                    ),
                  ),),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                Container(
                  width: 135,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  
                  child: MaterialButton(
                    onPressed: onCreateLive,
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                      ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text('Start Live! ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                        Icon(Icons.arrow_forward, color: Colors.black,),
                      ],
                    ),
                    ),
                )
                
              ],
            ),
          ),
        ),
      
    );
  }
  Future<void> onCreateLive() async{
    if (userNameController.text.isEmpty || channelNameController.text.isEmpty) {
      return;
    }
    await addUser();
   await Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context)=> BroadcasterView(channelNameController.text),
                              )
                            );
  }
  Future<void> addUser() async{
    User.users.add(userNameController.text);
    User.channelName.add(channelNameController.text);
    User.userImages.add('assets/user5.jpg');
  }
}
