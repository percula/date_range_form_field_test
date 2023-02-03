import 'package:date_range_form_field/date_range_form_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Initial Date Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Initial Date Sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ValueNotifier<DateTimeRange?> valueNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final range = DateTimeRange(
      start: DateTime(2023, 1, 1),
      end: DateTime(2023, 10, 1),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ValueListenableBuilder(
              valueListenable: valueNotifier,
              builder: (context, value, child) {
                return DateRangeField(
                  initialValue: value,
                  firstDate: DateTime(2023,1,1),
                  lastDate: DateTime(2023,12,31),
                  helpText: "Date Range",
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          valueNotifier.value = range;
        },
        tooltip: 'Increment',
        label: Text('Set initial date'),
        icon: const Icon(Icons.date_range),
      ),
    );
  }
}
