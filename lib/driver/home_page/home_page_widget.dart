import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/route_status/route_status_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:map_launcher/map_launcher.dart' as $ml;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!valueOrDefault<bool>(currentUserDocument?.isDriver, false)) {
        context.pushNamed('route_details');
      }
    });
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
        floatingActionButton: Align(
          alignment: AlignmentDirectional(1.0, 1.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              unawaited(
                () async {
                  await launchMap(
                    location: FFAppState().filLocation,
                    title: 'Fidelity International',
                  );
                }(),
              );
            },
            backgroundColor: Color(0xFF006193),
            elevation: 8.0,
            label: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.business,
                  color: FlutterFlowTheme.of(context).info,
                  size: 22.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Navigate to FIL',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Roboto',
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Route for : ${dateTimeFormat('d/M/y', getCurrentTimestamp)}',
                style: FlutterFlowTheme.of(context).displaySmall.override(
                      fontFamily: 'Roboto',
                      fontSize: 22.0,
                    ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  GoRouter.of(context).prepareAuthEvent();
                  await authManager.signOut();
                  GoRouter.of(context).clearRedirectLocation();

                  context.goNamedAuth('login_signup', context.mounted);
                },
                child: Icon(
                  Icons.logout,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<List<RouteDataRecord>>(
            stream: queryRouteDataRecord(
              queryBuilder: (routeDataRecord) => routeDataRecord
                  .where(
                    'driver',
                    isEqualTo: currentUserReference,
                  )
                  .orderBy('eta'),
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
              return Container(
                height: MediaQuery.sizeOf(context).height * 0.9,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 0.0, 10.0),
                          child: Text(
                            valueOrDefault<String>(
                              containerRouteDataRecordList.isNotEmpty
                                  ? valueOrDefault<String>(
                                      'Shift time: ${dateTimeFormat('jm', functions.getShiftTime(containerRouteDataRecordList.toList()))}',
                                      'No pickups Scheduled',
                                    )
                                  : 'No Rides Scheduled',
                              'No Rides Scheduled',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.sizeOf(context).height * 0.9,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final routes = containerRouteDataRecordList
                                  .where((e) =>
                                      dateTimeFormat('Hm', e.shift) ==
                                      dateTimeFormat(
                                          'Hm',
                                          functions.getShiftTime(
                                              containerRouteDataRecordList
                                                  .toList())))
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: routes.length,
                                itemBuilder: (context, routesIndex) {
                                  final routesItem = routes[routesIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: routesItem.status != null &&
                                                routesItem.status != ''
                                            ? FlutterFlowTheme.of(context)
                                                .accent4
                                            : FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 8.0,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            offset: Offset(0.0, 2.0),
                                          )
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 8.0, 12.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Color(0xFF006193),
                                              size: 32.0,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 8.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      routesItem.name,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyLarge
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: Color(
                                                                0xFF14181B),
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  4.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        routesItem.address
                                                            .maybeHandleOverflow(
                                                          maxChars: 50,
                                                          replacement: '…',
                                                        ),
                                                        maxLines: 2,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelSmall
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              color: Color(
                                                                  0xFF57636C),
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    Text(
                                                      dateTimeFormat('jm',
                                                          routesItem.eta!),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Roboto',
                                                                color: Color(
                                                                    0xFF414956),
                                                                fontSize: 12.0,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 4.0, 0.0),
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
                                                  currentUserLocationValue =
                                                      await getCurrentUserLocation(
                                                          defaultLocation:
                                                              LatLng(0.0, 0.0));
                                                  await launchMap(
                                                    location:
                                                        routesItem.location,
                                                    title: '',
                                                  );
                                                },
                                              ),
                                            ),
                                            FlutterFlowIconButton(
                                              borderColor: Color(0xFFE0E3E7),
                                              borderRadius: 8.0,
                                              borderWidth: 2.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.more_vert,
                                                color: Color(0xFF57636C),
                                                size: 20.0,
                                              ),
                                              onPressed: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Color(0x00F6F6F6),
                                                  barrierColor:
                                                      Color(0x001C1212),
                                                  useSafeArea: true,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () => _model
                                                              .unfocusNode
                                                              .canRequestFocus
                                                          ? FocusScope.of(
                                                                  context)
                                                              .requestFocus(_model
                                                                  .unfocusNode)
                                                          : FocusScope.of(
                                                                  context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child: Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.2,
                                                          child:
                                                              RouteStatusWidget(
                                                            routeId: routesItem
                                                                .reference,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
