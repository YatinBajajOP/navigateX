import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'live_location_model.dart';
export 'live_location_model.dart';

class LiveLocationWidget extends StatefulWidget {
  const LiveLocationWidget({super.key});

  @override
  State<LiveLocationWidget> createState() => _LiveLocationWidgetState();
}

class _LiveLocationWidgetState extends State<LiveLocationWidget> {
  late LiveLocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LiveLocationModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 54.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Driver\'s Live Location',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Roboto',
                  fontSize: 20.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<RouteDataRecord>>(
                  stream: queryRouteDataRecord(
                    queryBuilder: (routeDataRecord) => routeDataRecord.where(
                      'employee',
                      isEqualTo: currentUserReference,
                    ),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<RouteDataRecord> containerRouteDataRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final containerRouteDataRecord =
                        containerRouteDataRecordList.isNotEmpty
                            ? containerRouteDataRecordList.first
                            : null;
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<RouteDataRecord>(
                        stream: RouteDataRecord.getDocument(
                            containerRouteDataRecord!.reference),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          final googleMapRouteDataRecord = snapshot.data!;
                          return Builder(builder: (context) {
                            final _googleMapMarker = googleMapRouteDataRecord;
                            return FlutterFlowGoogleMap(
                              controller: _model.googleMapsController,
                              onCameraIdle: (latLng) =>
                                  _model.googleMapsCenter = latLng,
                              initialLocation: _model.googleMapsCenter ??=
                                  LatLng(13.106061, -59.613158),
                              markers: [
                                FlutterFlowMarker(
                                  _googleMapMarker.reference.path,
                                  _googleMapMarker.location!,
                                  () async {
                                    await requestPermission(locationPermission);
                                    await launchMap(
                                      location:
                                          googleMapRouteDataRecord.driverLoc,
                                      title: googleMapRouteDataRecord.driverLoc!
                                          .toString(),
                                    );
                                  },
                                ),
                              ],
                              markerColor: GoogleMarkerColor.violet,
                              mapType: MapType.normal,
                              style: GoogleMapStyle.standard,
                              initialZoom: 14.0,
                              allowInteraction: true,
                              allowZoom: true,
                              showZoomControls: true,
                              showLocation: true,
                              showCompass: true,
                              showMapToolbar: true,
                              showTraffic: true,
                              centerMapOnMarkerTap: true,
                            );
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
