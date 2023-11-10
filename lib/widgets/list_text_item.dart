import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_target_sistemas/theme/app_colors.dart';

class ListTextItem extends StatelessWidget {
  final String item;
  final bool isEdit;
  final Function() onEdit;
  final Function() onRemove;

  const ListTextItem({
    required this.item,
    required this.isEdit,
    required this.onEdit,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const BoxDecoration(
          border: Border(
        bottom: BorderSide(color: AppColors.light),
      )),
      child: ListTile(
        minVerticalPadding: 0,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        title: Text(
          item,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Wrap(
          children: [
            IconButton(
                onPressed: onEdit,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.edit_note,
                  size: 40,
                  color: AppColors.black,
                )),
            IconButton(
                onPressed: () => isEdit
                    ? showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title: const Text(
                                  'Um texto está sendo editado. Finalize-o para prosseguir a operação.'),
                              actions: [
                                TextButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: const Text('Ok'))
                              ],
                            ))
                    : showDialog(
                        context: context,
                        builder: (BuildContext context) => CupertinoAlertDialog(
                              title:
                                  const Text('Confirma a exclusão do texto?'),
                              actions: [
                                TextButton(
                                    onPressed: onRemove,
                                    child: const Text('Excluir',
                                        style:
                                            TextStyle(color: AppColors.error)))
                              ],
                            )),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(
                  Icons.cancel,
                  size: 40,
                  color: AppColors.error,
                ))
          ],
        ),
      ),
    );
  }
}
