import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'route_status_model.dart';
export 'route_status_model.dart';

class RouteStatusWidget extends StatefulWidget {
  const RouteStatusWidget({
    Key? key,
    required this.routeId,
  }) : super(key: key);

  final DocumentReference? routeId;

  @override
  _RouteStatusWidgetState createState() => _RouteStatusWidgetState();
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
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0x7F5A5C60),
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
                unawaited(
                  () async {
                    await widget.routeId!.update(createRouteDataRecordData(
                      status: 'Pick up',
                    ));
                  }(),
                );
                Navigator.pop(context);
              },
              child: Text(
                'Pick Up ',
                style: FlutterFlowTheme.of(context).labelLarge.override(
                      fontFamily: 'Rubik',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          SizedBox(
            width: 300.0,
            child: Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
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
                  await widget.routeId!.update(createRouteDataRecordData(
                    status: 'No Show',
                  ));
                }(),
              );
              Navigator.pop(context);
            },
            child: Text(
              'No Show',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Rubik',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(
            width: 300.0,
            child: Divider(
              thickness: 1.0,
              color: FlutterFlowTheme.of(context).accent4,
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
                  await widget.routeId!.update(createRouteDataRecordData(
                    status: 'Late',
                  ));
                }(),
              );
              Navigator.pop(context);
            },
            child: Text(
              'Late',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'Rubik',
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
