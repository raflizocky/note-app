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
  late GlobalKey<FormState> _formKey;
  String? _noteError;
  String? _descriptionError;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.initialNote ?? '');
    _descriptionController = TextEditingController(text: widget.initialDescription ?? '');
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _saveNote();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.initialNote != null ? 'Edit Note' : 'Add Note'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    labelText: 'Note Title',
                    errorText: _noteError,
                  ),
                  validator: (value) => _validateField(value, 'Title'),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Note Description',
                    errorText: _descriptionError,
                  ),
                  validator: (value) => _validateField(value, 'Description'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveNote();
                      Navigator.pop(
                        context,
                        {
                          'note': _noteController.text,
                          'description': _descriptionController.text,
                        },
                      );
                    }
                  },
                  child: const Text('Simpan'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _saveNote() {
    setState(() {
      _noteError = _noteController.text.isEmpty ? 'Fill the title.' : null;
      _descriptionError = _descriptionController.text.isEmpty ? 'Fill the description.' : null;
    });
  }

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName must not empty';
    }
    return null;
  }
}
