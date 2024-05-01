import 'package:flutter/material.dart';
import 'package:flutter_project2/containers/custom_input_form.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Text("Create Organise "),
          CustomInputForm(
              icon: Icons.event_outlined,
              label: "Event Name",
              hint: "Add event name"),
          SizedBox(
            height: 10,
          ),
          CustomInputForm(
              icon: Icons.photo_album_outlined, label: "Photo", hint: "+"),
          SizedBox(
            height: 10,
          ),
          CustomInputForm(
              icon: Icons.description_outlined,
              label: "Description",
              hint: "Add description"),
          SizedBox(
            height: 10,
          ),
          CustomInputForm(
              icon: Icons.location_on_outlined,
              label: "Location",
              hint: "Add location"),
          SizedBox(
            height: 10,
          ),
          CustomInputForm(
              icon: Icons.attach_money_outlined,
              label: "Sponsor",
              hint: "Enter sponsor"),
          SizedBox(
            height: 10,
          ),
          CustomInputForm(
              icon: Icons.people_outline,
              label: "Guests",
              hint: "Enter list of guests"),
          SizedBox(
            height: 10,
          ),
          CustomInputForm(
              icon: Icons.date_range_outlined, label: "Date", hint: ""),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
