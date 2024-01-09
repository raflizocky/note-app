import 'package:flutter/material.dart';
import 'add_note_page.dart';
import 'note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> notes = [
    {'note': 'Note 1', 'description': 'Description'},
    {'note': 'Note 2', 'description': 'Description'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) => NoteCard(
            noteData: notes[index],
            onDelete: () => _deleteNote(index),
            onEdit: () => _editNote(index),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNote(),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNote() async {
    final newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddNotePage()),
    );
    if (newNote != null) {
      setState(() {
        notes.add({
          'note': newNote['note']!,
          'description': newNote['description']!,
        });
      });
    }
  }

  void _editNote(int index) async {
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
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }
}
