
import 'package:flutter/material.dart';
import 'package:balnce_v1/Secondscreen.dart';
import 'package:provider/provider.dart';

import 'Data.dart';
class SpeakerImage2 extends StatelessWidget {
  final SpeakerModel model;
  final String imagePath;

  SpeakerImage2({required this.model, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    SpeakerModel speakerImageModel = Provider.of<SpeakerModel>(context);
    SpeakerModel model = Provider.of<SpeakerModel>(context);
    return Column(
      children: <Widget>[
        Image.asset(
          imagePath,
          width: 180,
          height: 300,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Right speaker',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                )),
            Switch(
              value: model.isRightSwitchOn,
              onChanged: (bool newValue) {
                model.toggleRightSwitch();
              },
            ),
          ],
        ),
        Text('mute or unmute'),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SpeakerSettingsScreen(
                  isLeftSpeaker: false,
                isLeftSwitchOn: speakerImageModel.isLeftSwitchOn,
                isRightSwitchOn: model.isRightSwitchOn,
              )),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(150, 50),
            ),
          ),
          child: Text(
            'Mix',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
