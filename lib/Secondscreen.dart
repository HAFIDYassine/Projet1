import 'package:flutter/material.dart';
import 'package:balnce_v1/Data.dart';
import 'package:provider/provider.dart';

class SpeakerSettingsScreen extends StatelessWidget {
  final bool isLeftSpeaker;
  final bool isLeftSwitchOn;
  final bool isRightSwitchOn;


  SpeakerSettingsScreen({required this.isLeftSpeaker,
    required this.isLeftSwitchOn,
    required this.isRightSwitchOn,

  });

  @override
  Widget build(BuildContext context) {
    SpeakerModel model = Provider.of<SpeakerModel>(context);
    String speakerName = isLeftSpeaker ? "Left" : "Right";
    double bassVolume = isLeftSpeaker
        ? model.leftSpeaker.bassVolume
        : model.rightSpeaker.bassVolume;
    double midrangeVolume = isLeftSpeaker
        ? model.leftSpeaker.midrangeVolume
        : model.rightSpeaker.midrangeVolume;
    double trebleVolume = isLeftSpeaker
        ? model.leftSpeaker.trebleVolume
        : model.rightSpeaker.trebleVolume;



    return Scaffold(
      appBar: AppBar(
        title: Text('$speakerName Speaker'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Row(
            crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0),
            child : Text(' Speaker on \n Mute or unmute '),
            ),
            Switch(
              value: isLeftSpeaker ? isLeftSwitchOn : isRightSwitchOn,
              onChanged: (bool newValue) {
                if (isLeftSpeaker) {
                  model.updateLeftSwitch(newValue);
                } else {
                  model.updateRightSwitch(newValue);
                }
              },
            ),


          ]
        ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child : Text('Bass'),
            ),
            Slider(
              value: bassVolume,
              min: -15,
              max: 15,
              onChanged: (double newValue) {
                if (isLeftSpeaker) {
                model.setLeftBassVolume(newValue);
              } else {
                  model.setRightBassVolume(newValue);
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child : Text('Mid'),
            ),
            Slider(
              value: midrangeVolume,
              min: -15,
              max: 15,
              onChanged: (double newValue) {
                if (isLeftSpeaker) {
                  model.setLeftMidrangeVolume(newValue);
                } else {
                  model.setRightMidrangeVolume(newValue);
                }

              },
            ),

            Padding(
              padding: EdgeInsets.only(left: 16.0),
              child : Text('Treble'),
            ),

            Slider(
              value: trebleVolume,
              min: -15,
              max: 15,
              onChanged: (double newValue) {
                if (isLeftSpeaker) {
                  model.setLeftTrebleVolume(newValue);
                } else {
                  model.setRightTrebleVolume(newValue);
                }

              },
            ),

          ],
        ),
      ),
    );
  }
}
