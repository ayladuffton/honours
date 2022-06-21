import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../ticket_detail/ticket_detail_widget.dart';
import '../ticket_list/ticket_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';

class ArchivedTicketsWidget extends StatefulWidget {
  const ArchivedTicketsWidget({Key key}) : super(key: key);

  @override
  _ArchivedTicketsWidgetState createState() => _ArchivedTicketsWidgetState();
}

class _ArchivedTicketsWidgetState extends State<ArchivedTicketsWidget> {
  List<TicketsRecord> simpleSearchResults = [];
  TextEditingController searchTextFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    searchTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TicketsRecord>>(
      stream: queryTicketsRecord(),
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
        List<TicketsRecord> archivedTicketsTicketsRecordList = snapshot.data;
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
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TicketListWidget(),
                  ),
                );
              },
            ),
            title: Text(
              'Archived Tickets',
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
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                                child: TextFormField(
                                  controller: searchTextFieldController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Search here...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xFF7C8791),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF090F13),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  await queryTicketsRecordOnce()
                                      .then(
                                        (records) => simpleSearchResults =
                                            TextSearch(
                                          records
                                              .map(
                                                (record) => TextSearchItem(
                                                    record, [
                                                  record.status,
                                                  record.title,
                                                  record.user,
                                                  record.priority,
                                                  record.category
                                                ]),
                                              )
                                              .toList(),
                                        )
                                                .search(
                                                    searchTextFieldController
                                                        .text)
                                                .map((r) => r.object)
                                                .toList(),
                                      )
                                      .onError(
                                          (_, __) => simpleSearchResults = [])
                                      .whenComplete(() => setState(() {}));

                                  setState(() =>
                                      FFAppState().showAllTickets = false);
                                },
                                text: 'Search',
                                options: FFButtonOptions(
                                  width: 100,
                                  height: 40,
                                  color: Color(0xFF4B39EF),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  borderRadius: 50,
                                ),
                              ),
                            ),
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 40,
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                              onPressed: () async {
                                setState(
                                    () => FFAppState().showAllTickets = true);
                                setState(() {
                                  searchTextFieldController?.clear();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (FFAppState().showAllTickets ?? true)
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: StreamBuilder<List<TicketsRecord>>(
                            stream: queryTicketsRecord(
                              queryBuilder: (ticketsRecord) => ticketsRecord
                                  .where('archive', isEqualTo: true)
                                  .orderBy('ticketNumber', descending: true),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              }
                              List<TicketsRecord> listViewTicketsRecordList =
                                  snapshot.data;
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: listViewTicketsRecordList.length,
                                itemBuilder: (context, listViewIndex) {
                                  final listViewTicketsRecord =
                                      listViewTicketsRecordList[listViewIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Ticket #',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Text(
                                            listViewTicketsRecord.ticketNumber
                                                .toString(),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TicketDetailWidget(
                                                  ticketDocRef:
                                                      listViewTicketsRecord
                                                          .reference,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Text(
                                                  'Title:  ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Text(
                                                    listViewTicketsRecord.title,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    if (!(FFAppState().showAllTickets) ?? true)
                      Expanded(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Builder(
                            builder: (context) {
                              final archivedTicketList =
                                  simpleSearchResults?.toList() ?? [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: archivedTicketList.length,
                                itemBuilder:
                                    (context, archivedTicketListIndex) {
                                  final archivedTicketListItem =
                                      archivedTicketList[
                                          archivedTicketListIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Ticket #',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                          Text(
                                            archivedTicketListItem.ticketNumber
                                                .toString(),
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                        child: InkWell(
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    TicketDetailWidget(
                                                  ticketDocRef:
                                                      archivedTicketListItem
                                                          .reference,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 10),
                                                child: Text(
                                                  'Title:  ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: Text(
                                                    archivedTicketListItem
                                                        .title,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
            ),
          ),
        );
      },
    );
  }
}
