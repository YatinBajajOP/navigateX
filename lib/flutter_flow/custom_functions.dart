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
  // routeDocs have shift and status, return first shift(sorted) corresponding to any of the status is ""
  if (routeDocs == null || routeDocs.isEmpty) {
    return null;
  }

  final shifts = <DateTime>[];

  for (final doc in routeDocs) {
    // final status = doc
    if (doc.status == "") {
      shifts.add(doc.shift!);
    }
  }

  if (shifts.isEmpty) {
    return null;
  }

  shifts.sort();
  return shifts.first;
}
