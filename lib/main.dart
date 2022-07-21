import 'package:flutter/material.dart';
import 'package:newproject/constants/constants.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_page.dart';
import 'utils/locator.dart';
import 'utils/share_prefs.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await locator<SharedPrefs>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: '',
      // theme: ThemeData(primarySwatch: Colors.blue),
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: ktextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const HomePage(),
    );
  }
}
