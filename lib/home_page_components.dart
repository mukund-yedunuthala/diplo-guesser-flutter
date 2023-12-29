import 'package:flutter/material.dart';

PreferredSizeWidget homeAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    title: Text(title),
  );
}

Widget homePageBody(BuildContext context, String questionSet) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        homePageLeadText(context),
        const SizedBox(height: 30),
        homePageEmojiRow(questionSet)
      ],
    ),
  );
}

Widget homePageFAB(Function onPressed) {
  return FloatingActionButton(
    onPressed: () {
      onPressed();
    },
    tooltip: 'Refresh',
    child: const Icon(Icons.refresh),
  );
}

Widget homePageLeadText(BuildContext context) {
  return Text(
    'Guess the incident based on this set of emoji:',
    style: Theme.of(context).textTheme.headlineMedium,
  );
}

Widget homePageEmojiRow(String questionSet) {
  return RichText(
      text: TextSpan(
    text: questionSet,
    style: const TextStyle(fontFamily: 'OpenMoji', fontSize: 48.0),
  ));
}
