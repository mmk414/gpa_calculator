import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'mainList.dart';
import '../models/grade.dart';

class BottomBar extends StatefulWidget {
  final Function addGrade;
  BottomBar(this.addGrade);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final creditController = TextEditingController();
  String dropdownVal = 'AA';
  String hintVal = 'Select Grade';

  // double getGradeNum(String dropDownVal){
  //   for (var i = 0; i < letterGrades.length; i++) {
  //     if(letterGrades.keys.where((element) => false))
  //   }
  // }

  void _submitData() {
    if (creditController.text.isEmpty) {
      return;
    }
    widget.addGrade(
        double.parse(creditController.text), letterGrades[dropdownVal]);
  }

  @override
  void dispose() {
    creditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      height: 40,
      // width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Credit INPUT
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 200),
              color: Colors.orange,
              child: TextField(
                // onSubmitted: (value) {
                //   // print(value);
                //   print(creditController.text);
                // },
                controller: creditController,
                decoration: const InputDecoration(
                  label: Text('Credits'),
                ),
              ),
            ),
          ),
          // GRADE SELECTION
          Flexible(
            child: Container(
              constraints: const BoxConstraints(minWidth: 100),
              child: DropdownButton2(
                  hint: Text(hintVal),
                  items: <String>['AA', 'BA', 'BB', 'CB', 'CC', 'DC', 'DD']
                      .map<DropdownMenuItem<String>>((String val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Container(
                        constraints: const BoxConstraints(minWidth: 100),
                        child: Text(
                          val,
                          textAlign: TextAlign.center,
                        ),
                        alignment: Alignment.center,
                      ),
                    );
                  }).toList(),
                  onChanged: (val) {
                    dropdownVal = val.toString();
                    setState(() {
                      hintVal = val.toString();
                    });
                  }),
            ),
          ),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 200),
              color: Colors.orange,
              child: ElevatedButton.icon(
                onPressed: _submitData,
                icon: const Icon(Icons.add),
                label: const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
