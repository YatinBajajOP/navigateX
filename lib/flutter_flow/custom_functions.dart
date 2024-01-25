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

DateTime? getShiftTime(List<DateTime>? etas) {
  // From etas get list of sorted, unique DateTimes then return DateTime greater than current datetime
  if (etas == null || etas.isEmpty) {
    return null;
  }

  // Get sorted, unique DateTimes
  final sortedUniqueDateTimes = etas.toSet().toList()..sort();

  // Find DateTime greater than current datetime
  final now = DateTime.now();
  for (final dateTime in sortedUniqueDateTimes) {
    if (dateTime.isAfter(now)) {
      return dateTime;
    }
  }

  return null;
}
