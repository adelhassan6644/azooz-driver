import 'package:azooz_diver/presentation/home_view/home_view.dart';
import 'package:azooz_diver/presentation/splash/splash.dart';
import 'package:azooz_diver/provider/home_provider/contact_proider.dart';
import 'package:azooz_diver/provider/them_provider/them_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:azooz_diver/di.dart' as di;
import 'package:provider/provider.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent));

  await di.init();

  runApp(
      MultiProvider(
          providers:  [
            ChangeNotifierProvider(create: (context) => di.sl<ContactProvider>()),
            ChangeNotifierProvider(create: (context) => di.sl<ThemProvider>()),
          ],
      child: const MyApp()
  ));


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Azooz Driver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:const HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
