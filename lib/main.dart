import 'package:counter_block/screens/home.dart';
import 'package:flutter/material.dart';
import "bloc/block_import.dart";
import "package:path_provider/path_provider.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(
    storage: storage,
    () => runApp(const MyApp()),
    blocObserver: CounterBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Counter by Block"),
            backgroundColor: Colors.amber,
          ),
          body: Counter(),
        ),
      ),
    );
  }
}
