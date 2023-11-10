import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'notes.store.g.dart';

class NotesStore = _NotesStore with _$NotesStore;

abstract class _NotesStore with Store {
  final SharedPreferences preferences;
  _NotesStore(this.preferences) {
    initData();
  }

  ObservableList<String> notes = ObservableList<String>();
  @observable
  TextEditingController noteController = TextEditingController();
  @observable
  FocusNode focusNode = FocusNode();

  static const _keyNotes = 'notes';

  @action
  initData() async {
    notes =
        ObservableList<String>.of(preferences.getStringList(_keyNotes) ?? []);
  }

  @action
  addNote(String note) async {
    notes.add(note);
    noteController.clear();
    focusNode.requestFocus();
    await preferences.setStringList(_keyNotes, notes);
  }

  @action
  deleteNote(int index) async {
    notes.removeAt(index);
    focusNode.requestFocus();
    await preferences.setStringList(_keyNotes, notes);
  }

  @action
  editNote(String item, int index) async {
    notes[index] = item;
    noteController.clear();
    focusNode.requestFocus();
    await preferences.setStringList(_keyNotes, notes);
  }
}
