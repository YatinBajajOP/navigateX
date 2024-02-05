import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'route_status_model.dart';
export 'route_status_model.dart';

class RouteStatusWidget extends StatefulWidget {
  const RouteStatusWidget({
    super.key,
    required this.routeDocument,
    bool? routeFinished,
  }) : this.routeFinished = routeFinished ?? false;

  final RouteDataRecord? routeDocument;
  final bool routeFinished;

  @override
  State<RouteStatusWidget> createState() => _RouteStatusWidgetState();
}

class _RouteStatusWidgetState extends State<RouteStatusWidget> {
  late RouteStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RouteStatusModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF515B6B),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'pickup_verification',
                  queryParameters: {
                    'routeID': serializeParam(
                      widget.routeDocument,
                      ParamType.Document,
                    ),
                    'routeCompleted': serializeParam(
                      widget.routeFinished,
                      ParamType.bool,
                    ),
                    'type': serializeParam(
                      'Pick up',
                      ParamType.String,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'routeID': widget.routeDocument,
                  },
                );

                Navigator.pop(context);
              },
              child: Text(
                'Picked Up ',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).success,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          SizedBox(
            width: 300.0,
            child: Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              unawaited(
                () async {
                  await widget.routeDocument!.reference
                      .update(createRouteDataRecordData(
                    status: 'No Show',
                  ));
                }(),
              );
              Navigator.pop(context);
              await actions.log(
                'EMPLOYEE_NO_SHOW',
                currentUserReference!,
                widget.routeDocument?.employee,
              );
              if (widget.routeFinished) {
                context.pushNamed('feedback');

                await actions.log(
                  'PICKUPS_COMPLETED',
                  currentUserReference!,
                  widget.routeDocument?.employee,
                );
                return;
              } else {
                return;
              }
            },
            child: Text(
              'No Show',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).error,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          SizedBox(
            width: 300.0,
            child: Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'pickup_verification',
                queryParameters: {
                  'routeID': serializeParam(
                    widget.routeDocument,
                    ParamType.Document,
                  ),
                  'routeCompleted': serializeParam(
                    widget.routeFinished,
                    ParamType.bool,
                  ),
                  'type': serializeParam(
                    'Late',
                    ParamType.String,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'routeID': widget.routeDocument,
                },
              );

              Navigator.pop(context);
            },
            child: Text(
              'Late',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Roboto',
                    color: FlutterFlowTheme.of(context).warning,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
