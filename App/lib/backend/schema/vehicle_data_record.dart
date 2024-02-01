import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VehicleDataRecord extends FirestoreRecord {
  VehicleDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "vendor" field.
  String? _vendor;
  String get vendor => _vendor ?? '';
  bool hasVendor() => _vendor != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "seats" field.
  int? _seats;
  int get seats => _seats ?? 0;
  bool hasSeats() => _seats != null;

  void _initializeFields() {
    _vendor = snapshotData['vendor'] as String?;
    _number = snapshotData['number'] as String?;
    _type = snapshotData['type'] as String?;
    _seats = castToType<int>(snapshotData['seats']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vehicle_data');

  static Stream<VehicleDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VehicleDataRecord.fromSnapshot(s));

  static Future<VehicleDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VehicleDataRecord.fromSnapshot(s));

  static VehicleDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VehicleDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VehicleDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VehicleDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VehicleDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VehicleDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVehicleDataRecordData({
  String? vendor,
  String? number,
  String? type,
  int? seats,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'vendor': vendor,
      'number': number,
      'type': type,
      'seats': seats,
    }.withoutNulls,
  );

  return firestoreData;
}

class VehicleDataRecordDocumentEquality implements Equality<VehicleDataRecord> {
  const VehicleDataRecordDocumentEquality();

  @override
  bool equals(VehicleDataRecord? e1, VehicleDataRecord? e2) {
    return e1?.vendor == e2?.vendor &&
        e1?.number == e2?.number &&
        e1?.type == e2?.type &&
        e1?.seats == e2?.seats;
  }

  @override
  int hash(VehicleDataRecord? e) =>
      const ListEquality().hash([e?.vendor, e?.number, e?.type, e?.seats]);

  @override
  bool isValidKey(Object? o) => o is VehicleDataRecord;
}
