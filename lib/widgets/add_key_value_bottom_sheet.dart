import 'package:flutter/material.dart';
import '../db_helper.dart';

class AddKeyValueBottomSheet extends StatefulWidget {
  final DBHelper dbHelper;
  final Function onDataChanged;

  const AddKeyValueBottomSheet(
      {required this.dbHelper, required this.onDataChanged, super.key});

  @override
  _AddKeyValueBottomSheetState createState() => _AddKeyValueBottomSheetState();
}

class _AddKeyValueBottomSheetState extends State<AddKeyValueBottomSheet> {
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  void dispose() {
    _keyController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _keyController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                labelText: 'Key',
                prefixIcon: const Icon(Icons.vpn_key, color: Colors.indigo),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _valueController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                labelText: 'Value',
                prefixIcon: const Icon(Icons.text_fields, color: Colors.indigo),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.cancel, color: Colors.red),
                  label: const Text('Cancel',
                      style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final key = _keyController.text.trim();
                    final value = _valueController.text.trim();

                    if (key.isNotEmpty && value.isNotEmpty) {
                      try {
                        await widget.dbHelper.insertKeyValue(key, value);
                        widget.onDataChanged();
                        Navigator.pop(context);
                      } catch (e) {
                        print('Error inserting data: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to save data.')),
                        );
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Key and value cannot be empty.')),
                      );
                    }
                  },
                  icon: const Icon(Icons.save, color: Colors.white),
                  label:
                      const Text('Save', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
