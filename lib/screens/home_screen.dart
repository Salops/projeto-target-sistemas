import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_target_sistemas/store/notes.store.dart';
import 'package:projeto_target_sistemas/theme/app_colors.dart';
import 'package:projeto_target_sistemas/widgets/footer.dart';
import 'package:projeto_target_sistemas/widgets/list_text_item.dart';
import 'package:projeto_target_sistemas/widgets/note_field.dart';
import 'package:projeto_target_sistemas/widgets/vertical_spacing.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? idxEdit;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final notesStore = Provider.of<NotesStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(24).copyWith(bottom: 8),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF1C4C44), Color(0xFF40A882)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Stack(
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 300,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(5, 50)),
                      ),
                      child: Observer(builder: (_) {
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          itemBuilder: ((context, index) {
                            final item = notesStore.notes[index];
                            return ListTextItem(
                                item: item,
                                isEdit: idxEdit != null,
                                onEdit: () {
                                  setState(() {
                                    idxEdit = index;
                                  });
                                  notesStore.noteController.text = item;
                                },
                                onRemove: () {
                                  notesStore.deleteNote(index);
                                  Navigator.of(context).pop();
                                });
                          }),
                          itemCount: notesStore.notes.length,
                        );
                      })),
                  const VerticalSpacing(spacing: 48),
                  NoteField(
                    focusNode: notesStore.focusNode,
                    controller: notesStore.noteController,
                    onFieldSubmitted: (value) {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    onSaved: (value) {
                      if (idxEdit != null) {
                        notesStore.editNote(value!, idxEdit!);

                        setState(() {
                          idxEdit = null;
                        });
                      } else {
                        notesStore.addNote(value!);
                      }
                    },
                  )
                ],
              ),
            ),
            Footer()
          ],
        ),
      )),
    );
  }
}
