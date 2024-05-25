import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project2/containers/custom_input_form.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  TextEditingController eventNameController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sponsorController = TextEditingController();
  TextEditingController guestsController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? selectedDateTime;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          selectedDateTime?.hour ?? 0,
          selectedDateTime?.minute ?? 0,
        );
        dateController.text = DateFormat('d MMMM yyyy').format(pickedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedDateTime = DateTime(
          selectedDateTime?.year ?? DateTime.now().year,
          selectedDateTime?.month ?? DateTime.now().month,
          selectedDateTime?.day ?? DateTime.now().day,
          pickedTime.hour,
          pickedTime.minute,
        );
        timeController.text = pickedTime.format(context);
      });
    }
  }

  Future<void> _addEvent() async {
    if (selectedDateTime != null) {
      await FirebaseFirestore.instance.collection('events').add({
        'name': eventNameController.text,
        'photoUrl': photoUrlController.text,
        'description': descriptionController.text,
        'location': locationController.text,
        'sponsor': sponsorController.text,
        'guests': guestsController.text,
        'datetime': selectedDateTime,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Event added successfully!')),
      );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and time')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Event'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomInputForm(
                icon: Icons.event_outlined,
                label: "Event Name",
                hint: "Add event name",
                controller: eventNameController),
            const SizedBox(
              height: 10,
            ),
            CustomInputForm(
                icon: Icons.photo_album_outlined,
                label: "Photo",
                hint: "+",
                controller: photoUrlController),
            const SizedBox(
              height: 10,
            ),
            CustomInputForm(
                icon: Icons.description_outlined,
                label: "Description",
                hint: "Add description",
                controller: descriptionController),
            const SizedBox(
              height: 10,
            ),
            CustomInputForm(
                icon: Icons.location_on_outlined,
                label: "Location",
                hint: "Add location",
                controller: locationController),
            const SizedBox(
              height: 10,
            ),
            CustomInputForm(
                icon: Icons.attach_money_outlined,
                label: "Sponsor",
                hint: "Enter sponsor",
                controller: sponsorController),
            const SizedBox(
              height: 10,
            ),
            CustomInputForm(
                icon: Icons.people_outline,
                label: "Guests",
                hint: "Enter list of guests",
                controller: guestsController),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: dateController,
              readOnly: true,
              decoration: InputDecoration(
                icon: const Icon(Icons.date_range_outlined),
                labelText: "Date",
                hintText: "Select date",
              ),
              onTap: () => _selectDate(context),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: timeController,
              readOnly: true,
              decoration: InputDecoration(
                icon: const Icon(Icons.access_time_outlined),
                labelText: "Time",
                hintText: "Select time",
              ),
              onTap: () => _selectTime(context),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _addEvent,
              child: const Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }
}
