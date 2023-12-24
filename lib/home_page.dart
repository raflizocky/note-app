import 'package:flutter/material.dart';
import 'add_note_page.dart';
import 'note_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> notes = [
    {'note': 'Catatan 1', 'description': 'Deskripsi catatan 1'},
    {'note': 'Catatan 2', 'description': 'Deskripsi catatan 2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Sederhana'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(
            noteData: notes[index],
            onDelete: () {
              setState(() {
                notes.removeAt(index);
              });
            },
            onEdit: () async {
              final editedNote = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNotePage(
                    initialNote: notes[index]['note'],
                    initialDescription: notes[index]['description'],
                  ),
                ),
              );
              if (editedNote != null) {
                setState(() {
                  notes[index]['note'] = editedNote['note']!;
                  notes[index]['description'] = editedNote['description']!;
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newNote = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNotePage()),
          );
          if (newNote != null) {
            setState(() {
              notes.add({
                'note': newNote['note']!,
                'description': newNote['description']!,
              });
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}