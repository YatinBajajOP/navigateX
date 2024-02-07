import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBdbFnbGFzV1NfFEwsiiw5d6w_TTTaHqHw",
            authDomain: "navigatex-improvathon.firebaseapp.com",
            projectId: "navigatex-improvathon",
            storageBucket: "navigatex-improvathon.appspot.com",
            messagingSenderId: "316138372846",
            appId: "1:316138372846:web:7023ae256b2c06a23cbdff",
            measurementId: "G-S0GELRL894"));
  } else {
    await Firebase.initializeApp();
  }
}
