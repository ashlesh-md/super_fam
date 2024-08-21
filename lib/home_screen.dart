import 'package:flutter/material.dart';
import './db_helper.dart';
import './widgets/add_key_value_bottom_sheet.dart';
import './widgets/key_value_pair_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper dbHelper = DBHelper();
  List<Map<String, dynamic>> keyValuePairs = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    List<Map<String, dynamic>> data = await dbHelper.getKeyValues();
    setState(() {
      keyValuePairs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Key-Value Pairs',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.white,
            )),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: keyValuePairs.isEmpty
            ? const Center(
                child: Text(
                  'No key-value pairs yet',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              )
            : ListView.builder(
                itemCount: keyValuePairs.length,
                itemBuilder: (ctx, index) {
                  return KeyValuePairCard(
                    keyText: keyValuePairs[index]['key'],
                    valueText: keyValuePairs[index]['value'],
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (_) => AddKeyValueBottomSheet(
            dbHelper: dbHelper,
            onDataChanged: _loadData,
          ),
        ),
        backgroundColor: Colors.indigo,
        elevation: 6,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
