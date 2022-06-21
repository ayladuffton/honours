import '../add_notes/add_notes_widget.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../ticket_update/ticket_update_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketDetailWidget extends StatefulWidget {
  const TicketDetailWidget({
    Key key,
    this.ticketDocRef,
  }) : super(key: key);

  final DocumentReference ticketDocRef;

  @override
  _TicketDetailWidgetState createState() => _TicketDetailWidgetState();
}

class _TicketDetailWidgetState extends State<TicketDetailWidget> {
  bool archivedCheckboxListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TicketsRecord>(
      stream: TicketsRecord.getDocument(widget.ticketDocRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final ticketDetailTicketsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Ticket #${ticketDetailTicketsRecord.ticketNumber.toString()}',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 2,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              'Created:  ${dateTimeFormat('d/M/y', ticketDetailTicketsRecord.date)}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Text(
                              'Due:  ${dateTimeFormat('d/M/y', ticketDetailTicketsRecord.due)}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              'User:  ${ticketDetailTicketsRecord.user}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Text(
                            'Source:  ${ticketDetailTicketsRecord.source}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Title:  ${ticketDetailTicketsRecord.title}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              'Status:  ${ticketDetailTicketsRecord.status}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Text(
                              'Action:  ${ticketDetailTicketsRecord.action}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              'Priority:  ${ticketDetailTicketsRecord.priority}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Text(
                            'Category:  ${ticketDetailTicketsRecord.category}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              'Device:  ${ticketDetailTicketsRecord.device}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Text(
                            'Area:  ${ticketDetailTicketsRecord.area}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Company:  ${ticketDetailTicketsRecord.company}',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              'Assigned:  ${ticketDetailTicketsRecord.assigned}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 100, 0),
                              child: Theme(
                                data: ThemeData(
                                  unselectedWidgetColor: Color(0xFF95A1AC),
                                ),
                                child: CheckboxListTile(
                                  value: archivedCheckboxListTileValue ??=
                                      ticketDetailTicketsRecord.archive,
                                  onChanged: (newValue) => setState(() =>
                                      archivedCheckboxListTileValue = newValue),
                                  title: Text(
                                    'Archived:',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  tileColor: Color(0xFFF5F5F5),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.trailing,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Text(
                              'Ticket Information:  ${ticketDetailTicketsRecord.infoText}',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TicketUpdateWidget(
                                    ticketDocRef:
                                        ticketDetailTicketsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            text: 'Edit Details',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddNotesWidget(
                                    ticketDocRef:
                                        ticketDetailTicketsRecord.reference,
                                  ),
                                ),
                              );
                            },
                            text: 'Add Note',
                            options: FFButtonOptions(
                              width: 130,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Notes:',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: StreamBuilder<List<NotesRecord>>(
                        stream: queryNotesRecord(
                          queryBuilder: (notesRecord) =>
                              notesRecord.orderBy('date', descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<NotesRecord> listViewNotesRecordList =
                              snapshot.data;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewNotesRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewNotesRecord =
                                  listViewNotesRecordList[listViewIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 10, 0),
                                      child: Text(
                                        dateTimeFormat('d/M/y',
                                                listViewNotesRecord.date)
                                            .maybeHandleOverflow(maxChars: 10),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                    Expanded(
                                      child: AutoSizeText(
                                        listViewNotesRecord.noteText,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
