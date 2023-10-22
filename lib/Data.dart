import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class SpeakerModel extends ChangeNotifier {
  bool isLeftSwitchOn = true;
  bool isRightSwitchOn = true;

  double balance = 0.0;
  double volume = 30;
  double bassVolume = 0;
  double midrangeVolume = 0;
  double trebleVolume = 0;

  SpeakerParameters leftSpeaker = SpeakerParameters();
  SpeakerParameters rightSpeaker = SpeakerParameters();

  void updateLeftSwitch(bool newValue) {
    isLeftSwitchOn = newValue;
    notifyListeners();
  }
  void updateRightSwitch(bool newValue) {
    isRightSwitchOn = newValue;
    notifyListeners();
  }

  void setLeftBassVolume(double newVolume) {
    leftSpeaker.bassVolume = newVolume;
    notifyListeners();
  }

  void setRightBassVolume(double newVolume) {
    rightSpeaker.bassVolume = newVolume;
    notifyListeners();
  }

  void setLeftMidrangeVolume(double newVolume) {
    leftSpeaker.midrangeVolume = newVolume;
    notifyListeners();
  }

  void setRightMidrangeVolume(double newVolume) {
    rightSpeaker.midrangeVolume = newVolume;
    notifyListeners();
  }

  void setLeftTrebleVolume(double newVolume) {
    leftSpeaker.trebleVolume = newVolume;
    notifyListeners();
  }

  void setRightTrebleVolume(double newVolume) {
    rightSpeaker.trebleVolume = newVolume;
    notifyListeners();
  }


  void updateBalance() {
    if (isLeftSwitchOn && !isRightSwitchOn) {
      balance = -4.0;
    } else if (!isLeftSwitchOn && isRightSwitchOn) {
      balance = 4.0;
    } else if (isLeftSwitchOn && isRightSwitchOn){
      balance = 0.0;
    }
    notifyListeners();

  }
  void setVolume(double newVolume) {
    volume = newVolume;
    notifyListeners();
  }
  void setBalance(double newBalance) {
    balance = newBalance;
    notifyListeners();
    if (balance == -4.0) {
      isLeftSwitchOn = true;
      isRightSwitchOn = false;
    } else if (balance == 4.0) {
      isLeftSwitchOn = false;
      isRightSwitchOn = true;
    } else if (balance == 0.0) {
      isLeftSwitchOn = true;
      isRightSwitchOn = true;
    }
  }

  void toggleLeftSwitch() {
    if (isRightSwitchOn) {
      isLeftSwitchOn = !isLeftSwitchOn;
      updateBalance();
    }
  }
  void toggleRightSwitch() {
    if (isLeftSwitchOn) {
      isRightSwitchOn = !isRightSwitchOn;
      updateBalance();
    }
  }


  }

class SpeakerParameters {
  bool isSwitchOn = true;
  double bassVolume = 0;
  double midrangeVolume = 0;
  double trebleVolume = 0;

}




