// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
// import '/flutter_flow/custom_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? log(
  String action,
  DocumentReference takenBy,
  DocumentReference? target,
) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  final now = DateTime.now();

  // Set the arguments as fields for the collection logs in firebase
  try {
    final logsCollection = FirebaseFirestore.instance.collection('logs');
    final logData = {
      'action': action,
      'taken_by': takenBy,
      'target': target,
      'timestamp': now,
    };
    logsCollection.add(logData);
    return null;
  } catch (e) {
    return e.toString();
  }

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
