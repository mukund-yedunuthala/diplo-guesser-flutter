import 'package:ctbt_riddler/home_page_state.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

void main() async {
  Client client = Client();
  client
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject('658d39322643d21f748d')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development
  final databases = Databases(client);
  const String databaseId = "658d3ed40c451b4ac552";
  const collectionId = "658d474bdfb4b0afe5ad";

  // const documentId = "658d3fb66f8f58063141";
  // Access the emoji and incident from the response
  final documents = await databases.listDocuments(
      databaseId: databaseId, collectionId: collectionId);
  final document = documents.documents[0];
  final emojis = document.data['emoji'];
  final incidents = document.data['incident'];
  runApp(MyApp(emojis: emojis, incidents: incidents));
}

class MyApp extends StatelessWidget {
  final dynamic emojis;
  final dynamic incidents;

  const MyApp({super.key, required this.emojis, required this.incidents});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(
          title: 'Guess the Incident', emojis: emojis, incidents: incidents),
    );
  }
}
