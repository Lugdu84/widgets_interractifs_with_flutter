import 'package:flutter/material.dart';

class InterractivePage extends StatefulWidget {
  const InterractivePage({Key? key}) : super(key: key);

  @override
  InterractivePageState createState() => InterractivePageState();
}

class InterractivePageState extends State<InterractivePage> {
  Color backgroundColor = Colors.white;
  Color textColor = Colors.black;
  bool textButtonPressed = false;
  IconData icon = Icons.favorite;
  String firstName = "";
  late TextEditingController controller;
  bool switchValue = true;
  double sliderValue = 50;
  Map<String, bool> courses = {"Carottes": false, "Oignon": true, "Ail": false};
  int groupeValue = 1;
  DateTime initialDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(updateAppBarText()),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          TextButton(
              onPressed: updateAppBar,
              child: Container(
                  padding: EdgeInsets.all(10),
                  height: 50,
                  width: 200,
                  color: Colors.green,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.work,
                          color: Colors.white,
                        ),
                        textButtonText()
                      ]))),
          ElevatedButton(
            onPressed: () => showDate(context),
            child: Text("Date actuelle: $initialDate"),
            style: ElevatedButton.styleFrom(
                elevation: 10, primary: Colors.yellow, shadowColor: Colors.red),
          ),
          IconButton(
            onPressed: setIcon,
            icon: Icon(icon),
            color: Colors.pink,
            splashRadius: 1,
          ),
          TextField(
            obscureText: true,
            obscuringCharacter: "*",
            decoration: InputDecoration(
                hintText: "Entrez votre prénom",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            keyboardType: TextInputType.name,
            onChanged: (newValue) {
              setState(() {
                firstName = newValue;
              });
            },
          ),
          Text(firstName),
          TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Entrez votre nom"),
            onChanged: ((newValue) {
              setState(() {});
            }),
          ),
          Text(controller.text),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(switchValue
                  ? "J'aime les chats"
                  : "Les chats sont démoniaques"),
              Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                  value: switchValue,
                  onChanged: ((bool) {
                    setState(() {
                      switchValue = bool;
                    });
                  }))
            ],
          ),
          Slider(
              min: 0,
              max: 100,
              value: sliderValue,
              onChanged: ((newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              })),
          Text("Valeu du slider : ${sliderValue.toInt()}"),
          checks(),
          radios()
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: updateColors,
        child: const Icon(Icons.build),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  updateColors() {
    setState(() {
      backgroundColor =
          (backgroundColor == Colors.white) ? Colors.black : Colors.white;
      textColor = (textColor == Colors.white) ? Colors.black : Colors.white;
    });
  }

  String updateAppBarText() {
    return textButtonPressed ? "Je m'y connais un peu" : "Les interractifs";
  }

  updateAppBar() {
    setState(() => textButtonPressed = !textButtonPressed);
  }

  Text textButtonText() {
    return Text(
      "Je susi un textButton",
      style: TextStyle(color: Colors.white),
    );
  }

  setIcon() {
    setState(() {
      icon = (icon == Icons.favorite) ? Icons.favorite_outline : Icons.favorite;
    });
  }

  Column checks() {
    List<Widget> children = [];
    courses.forEach((course, checked) {
      Widget row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(course),
          Checkbox(
              value: checked,
              onChanged: ((newValue) {
                setState(() {
                  courses[course] = newValue ?? false;
                });
              }))
        ],
      );
      children.add(row);
    });
    return Column(
      children: children,
    );
  }

  Row radios() {
    List<Widget> radios = [];
    for (var i = 0; i < 5; i++) {
      Radio radio = Radio(
          value: i,
          groupValue: groupeValue,
          onChanged: ((newValue) {
            setState(() {
              groupeValue = newValue as int;
            });
          }));
      radios.add(radio);
    }
    return Row(
      children: radios,
    );
  }

  showDate(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1978),
            lastDate: DateTime(2090))
        .then((value) {
      if (value != null) {
        setState(() {
          initialDate = value;
          print(initialDate.toLocal());
        });
      }
    });
  }
}
