import 'package:balnce_v1/Sliders.dart';
import 'package:balnce_v1/Speakers2.dart';
import 'package:flutter/material.dart';
import 'package:balnce_v1/Speakers.dart';
import 'package:balnce_v1/Data.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    SpeakerModel speakerModel = Provider.of<SpeakerModel>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings' ,
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          //fontWeight: FontWeight.bold
        ),
      ),
        backgroundColor: Colors.white,
    ),

      body: Container(
        //color: Colors.cyan,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget> [
          SizedBox(height: 20),
          VolumeSlider(model: speakerModel),
          BalanceSlider(model: speakerModel),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpeakerImage(model: speakerModel,imagePath: 'assets/images/speaker.jpg'),
              SpeakerImage2(model: speakerModel,imagePath: 'assets/images/speaker.jpg')
            ],
          ),


        ],



      ),
      ),
    );
  }
}
