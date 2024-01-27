import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime? getShiftTime(List<RouteDataRecord>? routeDocs) {
  List<DateTime> shifts = [];

  if (routeDocs != null) {
    for (var document in routeDocs) {
      // Assuming "shift" is the field you want to extract
      var shift = document.shift;

      // Check if the field is not null before adding to the list
      if (shift != null) {
        shifts.add(shift);
      }
    }
  }

  // From shifts get list of sorted, unique DateTimes then return DateTime greater than current datetime
  if (shifts.isEmpty) {
    return null;
  }

  // Get sorted, unique DateTimes
  final sortedUniqueDateTimes = shifts.toSet().toList()..sort();

  // Find DateTime greater than current datetime
  final now = DateTime.now();
  for (final dateTime in sortedUniqueDateTimes) {
    if (dateTime.isAfter(now)) {
      // DateTime shiftedDateTime = dateTime.add(Duration(minutes: 1));
      return dateTime;
    }
  }

  return null;
}
