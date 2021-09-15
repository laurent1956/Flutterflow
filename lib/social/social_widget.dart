import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../onboard1/onboard1_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialWidget extends StatefulWidget {
  SocialWidget({Key key}) : super(key: key);

  @override
  _SocialWidgetState createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 44, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Welcome',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0xFF090F13),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          '[userName]',
                          style: FlutterFlowTheme.title1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF4B39EF),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Checkout news and highlights below.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: Container(
                width: 120,
                height: 120,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/profile.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          TextFormField(
            onFieldSubmitted: (_) async {
              final postsCreateData = createPostsRecordData();
              await PostsRecord.collection.doc().set(postsCreateData);
            },
            controller: textController,
            obscureText: false,
            decoration: InputDecoration(
              labelText: 'mettez un commentaire',
              labelStyle: FlutterFlowTheme.title3.override(
                fontFamily: 'Open Sans',
                color: Color(0xFF4099F7),
                fontWeight: FontWeight.bold,
              ),
              hintText: '[Some hint text...]',
              hintStyle: FlutterFlowTheme.title3.override(
                fontFamily: 'Open Sans',
                color: Color(0xFF4099F7),
                fontWeight: FontWeight.bold,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
            ),
            style: FlutterFlowTheme.title3.override(
              fontFamily: 'Open Sans',
              color: Color(0xFF4099F7),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          FFButtonWidget(
            onPressed: () async {
              final postsCreateData = createPostsRecordData(
                posttext: dateTimeFormat('MMMMEEEEd', getCurrentTimestamp),
              );
              await PostsRecord.collection.doc().set(postsCreateData);
            },
            text: 'Button',
            options: FFButtonOptions(
              width: 130,
              height: 40,
              color: FlutterFlowTheme.primaryColor,
              textStyle: FlutterFlowTheme.subtitle2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
              ),
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
              borderRadius: 12,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: Onboard1Widget(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 24,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
