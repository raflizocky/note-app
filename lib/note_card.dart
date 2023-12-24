import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final Map<String, String> noteData;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const NoteCard({
    required this.noteData,
    required this.onDelete,
    required this.onEdit,
  });

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
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
