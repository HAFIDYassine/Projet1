import 'package:balnce_v1/Data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VolumeSlider extends StatelessWidget {
  final SpeakerModel model;

  VolumeSlider({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
    Padding(
    padding: EdgeInsets.only(left: 16.0),
    child : Text('Volume: ${model.volume.toInt()}'),
    ),

        Slider(
          value: model.volume,
          min: 0,
          max: 40,
          onChanged: (double newValue) {
            model.setVolume(newValue);
          },
        ),
      ],
    );
  }
}

class BalanceSlider extends StatelessWidget {
  final SpeakerModel model;

  BalanceSlider({required this.model});

  @override
  Widget build(BuildContext context) {
    SpeakerModel speakerImageModel = Provider.of<SpeakerModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
    Padding(
    padding: EdgeInsets.only(left: 16.0),
    child : Text('Balance: ${model.balance}'),
    ),
        Slider(
          value: model.balance,
          min: -4,
          max: 4,
          divisions: 8,
          onChanged: (double newValue) {
            model.setBalance(newValue);
            model.updateBalance();
          },
        ),
      ],
    );
  }
}
