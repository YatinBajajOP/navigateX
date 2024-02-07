import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RouteDataRecord extends FirestoreRecord {
  RouteDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "eta" field.
  DateTime? _eta;
  DateTime? get eta => _eta;
  bool hasEta() => _eta != null;

  // "driver" field.
  DocumentReference? _driver;
  DocumentReference? get driver => _driver;
  bool hasDriver() => _driver != null;

  // "employee" field.
  DocumentReference? _employee;
  DocumentReference? get employee => _employee;
  bool hasEmployee() => _employee != null;

  // "driver_loc" field.
  LatLng? _driverLoc;
  LatLng? get driverLoc => _driverLoc;
  bool hasDriverLoc() => _driverLoc != null;

  // "vehicle" field.
  DocumentReference? _vehicle;
  DocumentReference? get vehicle => _vehicle;
  bool hasVehicle() => _vehicle != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "shift" field.
  DateTime? _shift;
  DateTime? get shift => _shift;
  bool hasShift() => _shift != null;

  // "route_number" field.
  String? _routeNumber;
  String get routeNumber => _routeNumber ?? '';
  bool hasRouteNumber() => _routeNumber != null;

  // "otp" field.
  String? _otp;
  String get otp => _otp ?? '';
  bool hasOtp() => _otp != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _address = snapshotData['address'] as String?;
    _eta = snapshotData['eta'] as DateTime?;
    _driver = snapshotData['driver'] as DocumentReference?;
    _employee = snapshotData['employee'] as DocumentReference?;
    _driverLoc = snapshotData['driver_loc'] as LatLng?;
    _vehicle = snapshotData['vehicle'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _shift = snapshotData['shift'] as DateTime?;
    _routeNumber = snapshotData['route_number'] as String?;
    _otp = snapshotData['otp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('route_data');

  static Stream<RouteDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RouteDataRecord.fromSnapshot(s));

  static Future<RouteDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RouteDataRecord.fromSnapshot(s));

  static RouteDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RouteDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RouteDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RouteDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RouteDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RouteDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRouteDataRecordData({
  String? name,
  LatLng? location,
  String? address,
  DateTime? eta,
  DocumentReference? driver,
  DocumentReference? employee,
  LatLng? driverLoc,
  DocumentReference? vehicle,
  String? status,
  DateTime? shift,
  String? routeNumber,
  String? otp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
      'address': address,
      'eta': eta,
      'driver': driver,
      'employee': employee,
      'driver_loc': driverLoc,
      'vehicle': vehicle,
      'status': status,
      'shift': shift,
      'route_number': routeNumber,
      'otp': otp,
    }.withoutNulls,
  );

  return firestoreData;
}

class RouteDataRecordDocumentEquality implements Equality<RouteDataRecord> {
  const RouteDataRecordDocumentEquality();

  @override
  bool equals(RouteDataRecord? e1, RouteDataRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.location == e2?.location &&
        e1?.address == e2?.address &&
        e1?.eta == e2?.eta &&
        e1?.driver == e2?.driver &&
        e1?.employee == e2?.employee &&
        e1?.driverLoc == e2?.driverLoc &&
        e1?.vehicle == e2?.vehicle &&
        e1?.status == e2?.status &&
        e1?.shift == e2?.shift &&
        e1?.routeNumber == e2?.routeNumber &&
        e1?.otp == e2?.otp;
  }

  @override
  int hash(RouteDataRecord? e) => const ListEquality().hash([
        e?.name,
        e?.location,
        e?.address,
        e?.eta,
        e?.driver,
        e?.employee,
        e?.driverLoc,
        e?.vehicle,
        e?.status,
        e?.shift,
        e?.routeNumber,
        e?.otp
      ]);

  @override
  bool isValidKey(Object? o) => o is RouteDataRecord;
}
