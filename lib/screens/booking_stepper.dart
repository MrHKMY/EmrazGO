import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/screens/screens.dart';

class BookingStepper extends StatefulWidget {
  const BookingStepper({super.key});

  @override
  State<BookingStepper> createState() => _BookingStepperState();
}

class _BookingStepperState extends State<BookingStepper> {
  int stepperIndex = 0;
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

  final _nameController = TextEditingController();
  final _icController = TextEditingController();
  final _vaccineController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black,
              //     blurRadius: 2.0,
              //     spreadRadius: 0.0,
              //     offset: Offset(2.0, 2.0), // shadow direction: bottom right
              //   )
              // ],
            ),
            child: Stepper(
              type: StepperType.vertical,
              steps: getSteps(),
              currentStep: stepperIndex,
              onStepContinue: () async {
                final isLastStep = stepperIndex == getSteps().length - 1;
                if (isLastStep) {
                  // Todo : send data to firebase
                  try {
                    // OrderModel orderModel = OrderModel(
                    //     senderName: senderNameController.text,
                    //     senderPhone: senderPhoneController.text,
                    //     senderAddress: senderAddressController.text,
                    //     senderState: selectedItems,
                    //     senderArea: areaSelected,
                    //     receiverName: receiverNameController.text,
                    //     receiverPhone: receiverPhoneController.text,
                    //     receiverAddress: receiverAddressController.text,
                    //     receiverState: receiverSelectedItems,
                    //     receiverArea: receiverAreaSelected,
                    //     orderNumber: orderNumber,
                    //     status: "New Order",
                    //     driverAssigned: "No");
                    // await databaseService.saveOrder(orderModel);
                    // //TODO(1) : need to increment orderNumber here
                    // await databaseService.saveTracking(orderNumber);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Success')),
                    // );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfirmationScreen()),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Error: Something went wrong')));
                  }
                } else {
                  setState(() {
                    stepperIndex += 1;
                  });
                }
              },
              onStepCancel: () {
                setState(() {
                  stepperIndex -= 1;
                });
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                final isLastStep = stepperIndex == getSteps().length - 1;
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (stepperIndex != 0)
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: details.onStepCancel,
                            child: const Text('BACK'),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: stepperIndex > 0 ? StepState.complete : StepState.indexed,
          isActive: stepperIndex >= 0,
          title: const Text("Personal Info"),
          content: Column(children: [
            _buildTextFormField(
              textController: _nameController,
              label: "Name",
              //errorMessage: "Name cannot be empty",
              //icons: Icons.person,
              //color: Colors.blue[50],
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTextFormField(
              textController: _phoneController,
              label: "IC Number",
              //errorMessage: "Phone require 9 numbers",
              //icons: Icons.phone,
              //color: Colors.blue[50],
            ),
            const SizedBox(
              height: 10,
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
                                _buildCupertinoPicker(itemsYN, value));
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
                          selectItem != null ? selectItem : 'Vaccinated?',
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
                            return _buildBottomPicker(_buildVaccinePicker(
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
              height: 20,
            ),
            _buildTextFormField(
              textController: _emailController,
              label: "Email",
              //errorMessage: "Phone require 9 numbers",
              //icons: Icons.phone,
              //color: Colors.blue[50],
            ),
            const SizedBox(
              height: 10,
            ),
            _buildTextFormField(
              textController: _phoneController,
              label: "Phone",
              //errorMessage: "Phone require 9 numbers",
              //icons: Icons.phone,
              //color: Colors.blue[50],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
        Step(
          state: stepperIndex > 1 ? StepState.complete : StepState.indexed,
          isActive: stepperIndex >= 0,
          title: const Text("Address"),
          content: Column(children: [
            _buildTextFormField(
              textController: _addressController,
              label: "Address",
              //errorMessage: "Name cannot be empty",
              //icons: Icons.person,
              //color: Colors.blue[50],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: _buildTextFormField(
                    textController: _postcodeController,
                    label: "Postcode",
                    //errorMessage: "Name cannot be empty",
                    //icons: Icons.person,
                    //color: Colors.blue[50],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: _buildTextFormField(
                    textController: _cityController,
                    label: "City",
                    //errorMessage: "Name cannot be empty",
                    //icons: Icons.person,
                    //color: Colors.blue[50],
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
                  child: _buildTextFormField(
                    textController: _stateController,
                    label: "State",
                    //errorMessage: "Name cannot be empty",
                    //icons: Icons.person,
                    //color: Colors.blue[50],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: _buildTextFormField(
                    textController: _countryController,
                    label: "Country",
                    //errorMessage: "Name cannot be empty",
                    //icons: Icons.person,
                    //color: Colors.blue[50],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ),
      ];

  Widget _buildCupertinoPicker(List selection, int a) {
    return Container(
      child: CupertinoPicker(
        magnification: 1.0,
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
        magnification: 1.0,
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

class _buildTextFormField extends StatelessWidget {
  _buildTextFormField({
    required this.label,
    required this.textController,
    super.key,
  });

  String label;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: textController,
          cursorColor: Colors.black,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: label,
            border: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              //borderRadius: BorderRadius.circular(8)
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
