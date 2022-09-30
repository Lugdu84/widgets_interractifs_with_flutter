import 'package:flutter/material.dart';

class InterractivePage extends StatefulWidget {
  const InterractivePage({Key? key}) : super(key: key);

  @override
  InterractivePageState createState() => InterractivePageState();
}

class InterractivePageState extends State<InterractivePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Les interractifs"),
      ),
      body: const Center(child: Text("Apprendre les interractifs")),
    );
  }
}
