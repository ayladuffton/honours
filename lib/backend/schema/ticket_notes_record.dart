import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'ticket_notes_record.g.dart';

abstract class TicketNotesRecord
    implements Built<TicketNotesRecord, TicketNotesRecordBuilder> {
  static Serializer<TicketNotesRecord> get serializer =>
      _$ticketNotesRecordSerializer;

  @nullable
  DateTime get date;

  @nullable
  String get noteText;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(TicketNotesRecordBuilder builder) =>
      builder..noteText = '';

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('TicketNotes')
          : FirebaseFirestore.instance.collectionGroup('TicketNotes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('TicketNotes').doc();

  static Stream<TicketNotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TicketNotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TicketNotesRecord._();
  factory TicketNotesRecord([void Function(TicketNotesRecordBuilder) updates]) =
      _$TicketNotesRecord;

  static TicketNotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTicketNotesRecordData({
  DateTime date,
  String noteText,
}) =>
    serializers.toFirestore(
        TicketNotesRecord.serializer,
        TicketNotesRecord((t) => t
          ..date = date
          ..noteText = noteText));
