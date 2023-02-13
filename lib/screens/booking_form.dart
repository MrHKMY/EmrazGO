import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/screens.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  var selectItem;
  var selectVaccine;
  int value = 0;
  int vaccNameValue = 0;
  final itemsYN = [
    "No",
    "Yes",
  ];

  final vaccineName = [
    "Vaccine 1",
    "Vaccine 2",
    "Vaccine 3",
    "Vaccine 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Booking Form"),
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(20),
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BookingField(
                        label: 'Name',
                      ),
                      BookingField(
                        label: 'IC Number',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showCupertinoModalPopup<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return _buildBottomPicker(
                                          _buildCupertinoPicker(
                                              itemsYN, value));
                                    });
                              },
                              child: Container(
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white),
                                child: Center(
                                  child: Text(
                                    selectItem != null
                                        ? selectItem
                                        : 'Vaccinated?',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showCupertinoModalPopup<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return _buildBottomPicker(
                                          _buildVaccinePicker(
                                              vaccineName, vaccNameValue));
                                    });
                              },
                              child: Container(
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white),
                                child: Center(
                                  child: Text(
                                    selectVaccine != null
                                        ? selectVaccine
                                        : 'Vaccine Type',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BookingField(
                        label: 'Email',
                      ),
                      BookingField(
                        label: 'Phone',
                      ),
                      BookingField(
                        label: 'Address',
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Postcode",
                                // border: OutlineInputBorder(
                                //     borderSide:
                                //         const BorderSide(color: Colors.black),
                                //     borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                labelText: "City",
                                // border: OutlineInputBorder(
                                //     borderSide:
                                //         const BorderSide(color: Colors.black),
                                //     borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                labelText: "State",
                                // border: OutlineInputBorder(
                                //     borderSide:
                                //         const BorderSide(color: Colors.black),
                                //     borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                labelText: "Country",
                                // border: OutlineInputBorder(
                                //     borderSide:
                                //         const BorderSide(color: Colors.black),
                                //     borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmationScreen()),
                            );
                          },
                          child: Text("Next"),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      )
                    ],
                  ))),
        ));
  }

  Widget _buildCupertinoPicker(List selection, int a) {
    return Container(
      child: CupertinoPicker(
        magnification: 1.5,
        backgroundColor: Colors.white,
        itemExtent: 50, //height of each item
        looping: false,
        children: selection
            .map((item) => Center(
                  child: Text(
                    item,
                    // style: TextStyle(fontSize: 32),
                  ),
                ))
            .toList(),
        onSelectedItemChanged: (index) {
          setState(() => a = index);
          selectItem = selection[index];
          print("Selected Item: $selectItem");
          // setState(() {
          //   selectItem = value.toString();
          // });
        },
      ),
    );
  }

  Widget _buildVaccinePicker(List selection, int a) {
    return Container(
      child: CupertinoPicker(
        magnification: 1.5,
        backgroundColor: Colors.white,
        itemExtent: 50, //height of each item
        looping: false,
        children: selection
            .map((item) => Center(
                  child: Text(
                    item,
                    // style: TextStyle(fontSize: 32),
                  ),
                ))
            .toList(),
        onSelectedItemChanged: (index) {
          setState(() => a = index);
          selectVaccine = selection[index];
          print("Selected Vaccine: $selectVaccine");
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
      padding: const EdgeInsets.only(top: 6.0),
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

class BookingField extends StatelessWidget {
  BookingField({
    required this.label,
    super.key,
  });

  String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8),
            labelText: label,
            // border: UnderlineInputBorder(
            //   borderSide: const BorderSide(color: Colors.black),
            //   //borderRadius: BorderRadius.circular(8)
            // ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
