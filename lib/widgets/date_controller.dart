/*import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_project2/views/create_event_page.dart';

class DataController extends GetxController {
  CreateEventPage() async {
   
   
   
    bool isCompleted = false;
  
    await FirebaseFirestore.instance.collection('Events')
    .add(eventData)
    .then((value){
      isCompleted = true;
      Get.snackbar('Event is online', 'Event uploaded successfully.', 
      colorText: Colors.white, backgroundColor: Colors.red);
    })
  
  }
}
*/