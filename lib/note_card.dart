import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Map<String, String> noteData;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const NoteCard({
    Key? key,
    required this.noteData,
    required this.onDelete,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(noteData['note']!),
        subtitle: Text(noteData['description']!),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
