import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'route_info_model.dart';
export 'route_info_model.dart';

class RouteInfoWidget extends StatefulWidget {
  const RouteInfoWidget({
    super.key,
    required this.routeNumber,
    required this.driverDoc,
  });

  final String? routeNumber;
  final DocumentReference? driverDoc;

  @override
  State<RouteInfoWidget> createState() => _RouteInfoWidgetState();
}

class _RouteInfoWidgetState extends State<RouteInfoWidget> {
  late RouteInfoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RouteInfoModel());
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
            'Route Information',
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Roboto',
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Colleagues travelling with you',
                    style: FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                StreamBuilder<List<RouteDataRecord>>(
                  stream: queryRouteDataRecord(
                    queryBuilder: (routeDataRecord) => routeDataRecord.where(
                      'route_number',
                      isEqualTo: widget.routeNumber,
                    ),
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
                    List<RouteDataRecord> listViewRouteDataRecordList =
                        snapshot.data!;
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewRouteDataRecordList.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.0),
                      itemBuilder: (context, listViewIndex) {
                        final listViewRouteDataRecord =
                            listViewRouteDataRecordList[listViewIndex];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: listViewRouteDataRecord.status != null &&
                                    listViewRouteDataRecord.status != ''
                                ? FlutterFlowTheme.of(context).accent4
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x320E151B),
                                offset: Offset(0.0, 4.0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listViewRouteDataRecord.name,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18.0,
                                            ),
                                      ),
                                      Text(
                                        'Address: ${listViewRouteDataRecord.address}',
                                        maxLines: 4,
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                      Text(
                                        'ETA: ${dateTimeFormat('jm', listViewRouteDataRecord.eta)}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                      ),
                                    ].divide(SizedBox(height: 4.0)),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 4.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor: Color(0xFFE0E3E7),
                                            borderRadius: 8.0,
                                            borderWidth: 2.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.location_on,
                                              color: Color(0xFF57636C),
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              await launchMap(
                                                location:
                                                    listViewRouteDataRecord
                                                        .location,
                                                title: listViewRouteDataRecord
                                                    .address,
                                              );
                                            },
                                          ),
                                        ),
                                        if (listViewRouteDataRecord.status !=
                                                null &&
                                            listViewRouteDataRecord.status !=
                                                '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 4.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Color(0xFFE0E3E7),
                                              borderRadius: 8.0,
                                              borderWidth: 2.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.circle,
                                                color: () {
                                                  if (listViewRouteDataRecord
                                                          .status ==
                                                      'Pick up') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .success;
                                                  } else if (listViewRouteDataRecord
                                                          .status ==
                                                      'No Show') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .error;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .warning;
                                                  }
                                                }(),
                                                size: 20.0,
                                              ),
                                              onPressed: () {
                                                print('IconButton pressed ...');
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
