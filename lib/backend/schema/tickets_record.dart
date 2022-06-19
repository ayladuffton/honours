import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tickets_record.g.dart';

abstract class TicketsRecord
    implements Built<TicketsRecord, TicketsRecordBuilder> {
  static Serializer<TicketsRecord> get serializer => _$ticketsRecordSerializer;

  @nullable
  String get action;

  @nullable
  DateTime get date;

  @nullable
  DateTime get due;

  @nullable
  String get source;

  @nullable
  String get status;

  @nullable
  int get ticketNumber;

  @nullable
  String get title;

  @nullable
  String get user;

  @nullable
  String get priority;

  @nullable
  String get category;

  @nullable
  String get device;

  @nullable
  String get area;

  @nullable
  String get company;

  @nullable
  String get assigned;

  @nullable
  int get archive;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TicketsRecordBuilder builder) => builder
    ..action = ''
    ..source = ''
    ..status = ''
    ..ticketNumber = 0
    ..title = ''
    ..user = ''
    ..priority = ''
    ..category = ''
    ..device = ''
    ..area = ''
    ..company = ''
    ..assigned = ''
    ..archive = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tickets');

  static Stream<TicketsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TicketsRecord._();
  factory TicketsRecord([void Function(TicketsRecordBuilder) updates]) =
      _$TicketsRecord;

  static TicketsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTicketsRecordData({
  String action,
  DateTime date,
  DateTime due,
  String source,
  String status,
  int ticketNumber,
  String title,
  String user,
  String priority,
  String category,
  String device,
  String area,
  String company,
  String assigned,
  int archive,
}) =>
    serializers.toFirestore(
        TicketsRecord.serializer,
        TicketsRecord((t) => t
          ..action = action
          ..date = date
          ..due = due
          ..source = source
          ..status = status
          ..ticketNumber = ticketNumber
          ..title = title
          ..user = user
          ..priority = priority
          ..category = category
          ..device = device
          ..area = area
          ..company = company
          ..assigned = assigned
          ..archive = archive));
