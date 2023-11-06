import 'package:appointment_booking/controllers/doctor_dropdown_controller.dart';
import 'package:appointment_booking/controllers/textfield_dropdown_controller.dart';
import 'package:appointment_booking/view/widgets_common/radio_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/intl.dart';
import '../widgets_common/appbar_widget.dart';
import '../widgets_common/custom_textfield.dart';
import '../widgets_common/round_button.dart';
import '../widgets_common/time_slot.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bookController = Get.put(BookController());

    var nameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    final TextFieldDropDownController controller = Get.put(TextFieldDropDownController());


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: appbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text("Personal Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
              Text("We share this information with the doctor", style: TextStyle(fontSize: 12, color: Colors.black87),),
              customTextField(controller: nameController,title: "Patient's Name", hint: "Enter name", sufIcon: DropdownButton<String>(
                value: controller.selectedItem.value,
                onChanged: (newValue) {
                  controller.selectedItem.value = newValue!;
                },
                items: <String>['Me']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),),
              customTextField(controller: phoneNumberController, title: "Phone Number", hint: "Enter phone number", ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.only(left: 15.0, bottom: 5),
                child: Text("Birth Gender"),
              ),
              Row(
                children: [
                  addRadioButton(0, "Male"),
                  addRadioButton(1, "Female"),
                ],
              ),

              SizedBox(height: 20,),


              Obx( () => SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    isExpanded: true,
                    hint: Text(
                      'Next Available',
                    ),
                    onChanged: (newValue) {
                      bookController.setSelected(newValue as String);
                    },
                    value: bookController.selected.value,
                    items: bookController.listType!.map((selectedType) {
                      return DropdownMenuItem(
                        child: new Text(
                          selectedType,
                        ),
                        value: selectedType,
                      );
                    }).toList(),
                  ),
                ),
              )
              ),

              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: Text("Availabilty", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),),
              ),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                padding: EdgeInsets.all(15),
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, f) {
                    int day = DateTime.now().day + f;
                    return FittedBox(
                      child: Container(
                        width: 90,
                        height: 90,
                        margin: EdgeInsets.only(right: 15.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: day == DateTime.now().day
                              ? Colors.pink.withOpacity(0.3)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${DateTime.now().day + f}",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: day == DateTime.now().day
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                color: day == DateTime.now().day
                                    ? Colors.pink
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              DateFormat('EE').format(
                                DateTime.now().add(
                                  Duration(days: f),
                                ),
                              ),
                              style: TextStyle(
                                  color: day == DateTime.now().day
                                      ? Colors.pink
                                      : Colors.black,
                                  fontWeight: day == DateTime.now().day
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 12, top: 15),
                child: Text("Morning Slots"),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  timeSlot(title: "08:00 AM", textColor: Colors.pink, backColor: Colors.pink.withOpacity(0.2), borderColor: Colors.pink ),
                  timeSlot(title: "09:00 AM" ),
                  timeSlot(title: "10:00 AM" ),
                  timeSlot(title: "11:00 AM" ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  timeSlot(title: "09:00 AM" ),
                  timeSlot(title: "10:00 AM" ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 12, top: 15),
                child: Text("Evening Slots"),
              ),
              Row(
                children: [
                  timeSlot(title: "06:00 PM", textColor: Colors.pink, backColor: Colors.pink.withOpacity(0.2), borderColor: Colors.pink ),
                  timeSlot(title: "06:30 PM" ),
                  timeSlot(title: "07:00 PM" ),
                  timeSlot(title: "08:00 PM" ),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  timeSlot(title: "09:00 PM" ),
                  timeSlot(title: "10:00 PM" ),
                ],
              ),

              SizedBox(height: 10,),
              Divider(),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Symptoms / Text Free", style: TextStyle(fontSize: 18),),
                  Icon(Icons.keyboard_arrow_down_sharp,)
                ],
              ),
              customTextField(controller: phoneNumberController, title: "Please write in box or just select symptoms below",
                hint: "Write", isDesc: true ),

              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  timeSlot(title: "Fever", textColor: Colors.pink, backColor: Colors.pink.withOpacity(0.2), borderColor: Colors.pink ),
                  timeSlot(title: "Rashes" ),
                  timeSlot(title: "Less Sleep" ),
                ],
              ),

              customTextField(controller: phoneNumberController, title: "Medical History",
                  hint: "Write", isDesc: true ),
              SizedBox(height: 10,),
              Divider(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Upload File", style: TextStyle(fontSize: 18),),
                  Icon(Icons.keyboard_arrow_down_sharp,)
                ],
              ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        width: 1,
                        color: Colors.black
                    )
                ),
                child: Center(child: Text("Not yet uploaded",
                  style: TextStyle(fontSize: 14),))),
          ),
              Divider(),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 180,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.watch_later_outlined, color: Colors.pink,),
                          SizedBox(width: 5,),
                          Center(child: Text(intl.DateFormat('EEE, MMM d, ''yy').format(DateTime.now()),
                            style: TextStyle(fontSize: 14, color: Colors.pink),)),
                        ],
                      ),
                    )),
              ),

              SizedBox(height: 5,),
              roundButton(onPress: (){}, color: Colors.pink, title: "Next", textColor: Colors.white),
              SizedBox(height: 5,),



            ],
          ),
        ),
      ),
    );
  }
}

