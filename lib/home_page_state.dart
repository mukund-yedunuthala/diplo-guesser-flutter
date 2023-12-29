import 'package:ctbt_riddler/home_page_components.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  final dynamic emojis;
  final dynamic incidents;
  final String title;
  const HomePage(
      {super.key,
      required this.title,
      required this.emojis,
      required this.incidents});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pickEmoji(final dynamic emojis) {
    Random random = Random();
    int randomIndex = random.nextInt(emojis.length);
    return emojis[randomIndex];
  }

  void _refreshPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final questionSet = _pickEmoji(widget.emojis);
    return Scaffold(
      appBar: homeAppBar(context, widget.title),
      body: homePageBody(context, questionSet),
      floatingActionButton: homePageFAB(_refreshPage),
    );
  }
}
