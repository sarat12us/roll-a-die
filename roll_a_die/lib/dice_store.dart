import 'package:cloud_firestore/cloud_firestore.dart';

class DiceStore {
  final databaseReference = Firestore.instance;
  DiceResult diceRes;

  void initialize() {
    String length  = databaseReference.collection("dice_result").snapshots().length.toString();
    if (length=='0') {
      databaseReference.collection("dice_result")
      .document("1")
      .setData({
        'occur': -1,
        'state': 'stop',
        'userid': ''
      });
    }
  }

  Future<String> getDiceResult() async {
    initialize();
    return databaseReference.collection("dice_result").document("1").get().then((snapshot) {
      try {
        diceRes = DiceResult.fromSnapshot(snapshot);
        return diceRes.state;
      } catch (e) {
        print(e);
        return diceRes.userid = null;
      }
    });
  }

  void playDice(String userid) {
    initialize();
    databaseReference.collection("dice_result").document("1").updateData({
      'userid': userid,
      'state': "play",
      'occur': -1  
    });
  }

  void stopDice(String userid, int occur) {
    initialize();
    databaseReference.collection("dice_result").document("1").updateData({
      'userid': userid,
      'state': "stop",
      'occur': occur  
    });
  }
}

class DiceResult {

  int occur = -1;
  String state = 'stop';
  String userid;
  DiceResult.fromSnapshot(DocumentSnapshot snapshot)
      : occur = snapshot['occur'],
        state = snapshot['state'],
        userid = snapshot['userid'];
        
}