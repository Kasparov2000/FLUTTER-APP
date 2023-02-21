import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, dynamic>> _data = [
    {'id': 1, 'name': 'John Doe', 'age': 28},
    {'id': 2, 'name': 'Jane Smith', 'age': 35},
    {'id': 3, 'name': 'Bob Johnson', 'age': 42},
    {'id': 4, 'name': 'Alice Williams', 'age': 29},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.pinkAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DataViews'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: _data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Theme.of(context).accentColor,
                      child: ListTile(
                        title: Text(
                          _data[index]['name'],
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Age: ${_data[index]['age']}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        leading: Icon(
                          Icons.person,
                          color: Theme.of(context).accentColor,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            DataTable(
              columns: [
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Age')),
              ],
              rows: _data.map((row) {
                return DataRow(cells: [
                  DataCell(Text(row['id'].toString())),
                  DataCell(Text(row['name'])),
                  DataCell(Text(row['age'].toString())),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
