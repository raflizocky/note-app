import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  final String? initialNote;
  final String? initialDescription;

  const AddNotePage({Key? key, this.initialNote, this.initialDescription}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  late TextEditingController _noteController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.initialNote ?? '');
    _descriptionController = TextEditingController(text: widget.initialDescription ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.initialNote != null ? 'Edit Catatan' : 'Tambah Catatan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Judul Catatan'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi Catatan'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  {
                    'note': _noteController.text,
                    'description': _descriptionController.text,
                  },
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
