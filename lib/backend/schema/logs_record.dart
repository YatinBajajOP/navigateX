import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LogsRecord extends FirestoreRecord {
  LogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "action" field.
  String? _action;
  String get action => _action ?? '';
  bool hasAction() => _action != null;

  // "taken_by" field.
  DocumentReference? _takenBy;
  DocumentReference? get takenBy => _takenBy;
  bool hasTakenBy() => _takenBy != null;

  // "target" field.
  DocumentReference? _target;
  DocumentReference? get target => _target;
  bool hasTarget() => _target != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _action = snapshotData['action'] as String?;
    _takenBy = snapshotData['taken_by'] as DocumentReference?;
    _target = snapshotData['target'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('logs');

  static Stream<LogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LogsRecord.fromSnapshot(s));

  static Future<LogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LogsRecord.fromSnapshot(s));

  static LogsRecord fromSnapshot(DocumentSnapshot snapshot) => LogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLogsRecordData({
  String? action,
  DocumentReference? takenBy,
  DocumentReference? target,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'action': action,
      'taken_by': takenBy,
      'target': target,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class LogsRecordDocumentEquality implements Equality<LogsRecord> {
  const LogsRecordDocumentEquality();

  @override
  bool equals(LogsRecord? e1, LogsRecord? e2) {
    return e1?.action == e2?.action &&
        e1?.takenBy == e2?.takenBy &&
        e1?.target == e2?.target &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(LogsRecord? e) => const ListEquality()
      .hash([e?.action, e?.takenBy, e?.target, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is LogsRecord;
}
