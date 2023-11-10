// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotesStore on _NotesStore, Store {
  late final _$noteControllerAtom =
      Atom(name: '_NotesStore.noteController', context: context);

  @override
  TextEditingController get noteController {
    _$noteControllerAtom.reportRead();
    return super.noteController;
  }

  @override
  set noteController(TextEditingController value) {
    _$noteControllerAtom.reportWrite(value, super.noteController, () {
      super.noteController = value;
    });
  }

  late final _$focusNodeAtom =
      Atom(name: '_NotesStore.focusNode', context: context);

  @override
  FocusNode get focusNode {
    _$focusNodeAtom.reportRead();
    return super.focusNode;
  }

  @override
  set focusNode(FocusNode value) {
    _$focusNodeAtom.reportWrite(value, super.focusNode, () {
      super.focusNode = value;
    });
  }

  late final _$initDataAsyncAction =
      AsyncAction('_NotesStore.initData', context: context);

  @override
  Future initData() {
    return _$initDataAsyncAction.run(() => super.initData());
  }

  late final _$addNoteAsyncAction =
      AsyncAction('_NotesStore.addNote', context: context);

  @override
  Future addNote(String note) {
    return _$addNoteAsyncAction.run(() => super.addNote(note));
  }

  late final _$deleteNoteAsyncAction =
      AsyncAction('_NotesStore.deleteNote', context: context);

  @override
  Future deleteNote(int index) {
    return _$deleteNoteAsyncAction.run(() => super.deleteNote(index));
  }

  late final _$editNoteAsyncAction =
      AsyncAction('_NotesStore.editNote', context: context);

  @override
  Future editNote(String item, int index) {
    return _$editNoteAsyncAction.run(() => super.editNote(item, index));
  }

  @override
  String toString() {
    return '''
noteController: ${noteController},
focusNode: ${focusNode}
    ''';
  }
}
