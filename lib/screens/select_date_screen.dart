import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/widgets/card_widget.dart';

class SelectDateScreen extends StatefulWidget {
  const SelectDateScreen({super.key});

  @override
  State<SelectDateScreen> createState() => _SelectDateScreenState();
}

class _SelectDateScreenState extends State<SelectDateScreen> {
  var selectItem;
  int value = 0;
  final dateExample = [
    "February 2023",
    "March 2023",
    "April 2023",
    "May 2023",
    "June 2023",
    "July 2023",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Date")),
      backgroundColor: Colors.grey[200],
      body: Card(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("ECONOMY PACKAGE"),
                      Text("Selection Date"),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  showCupertinoModalPopup<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildBottomPicker(_buildCupertinoPicker());
                      });
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey),
                      color: Colors.white),
                  child: Center(
                    child: Text(
                      selectItem != null ? selectItem : 'Select Date',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Expanded(
                child: GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(index);
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Text("index: $index"),
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoPicker() {
    return Container(
      child: CupertinoPicker(
        magnification: 1.0,
        backgroundColor: Colors.white,
        itemExtent: 50, //height of each item
        looping: false,
        children: dateExample
            .map((item) => Center(
                  child: Text(
                    item,
                    // style: TextStyle(fontSize: 32),
                  ),
                ))
            .toList(),
        onSelectedItemChanged: (index) {
          setState(() => value = index);
          selectItem = dateExample[index];
          print("Selected Item: $selectItem");
          // setState(() {
          //   selectItem = value.toString();
          // });
        },
      ),
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 200,
      //padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }
}
