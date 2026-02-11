import 'package:flutter/material.dart';
import 'package:rabwat_alriyad_new/app/app.dart';
import 'package:rabwat_alriyad_new/app/di/injection_container.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    //await dotenv.load(fileName: ".env");
    await di.init();
    runApp(const MyApp());
  } catch (e) {
    debugPrint('Initialization error: $e');
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Error: $e'),
        ),
      ),
    ));
  }
}
