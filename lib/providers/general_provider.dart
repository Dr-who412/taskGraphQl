import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:intl/intl.dart';
import 'package:untitled/utils/constatnt/app_consstant.dart';
import 'package:untitled/utils/shared/network/graphQl_path.dart';

import '../utils/shared/network/graphQl.dart';
class GeneralProvider extends ChangeNotifier{
//set token
setToken({required String token}){
  AppConst.TOKEN=token;
  final HttpLink httpLink = HttpLink("http://accuratess.mywire.org:8000/graphql",
      defaultHeaders: {"Authorization": "Bearer ${AppConst.TOKEN}"}
  );

  authLink = AuthLink(getToken: () async => 'Bearer ${AppConst.TOKEN}');
  link = authLink.concat(httpLink as Link);
  print('Bearer ${AppConst.TOKEN}');
  print(  authLink.toString());
  graphQLClient = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    ),
  );
  graphQLClient.notifyListeners();
}
  var loginKay=GlobalKey<FormState>();
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
//to create pickup
  var creatPickUpKay=GlobalKey<FormState>();
  TextEditingController fromtimeController=TextEditingController();
  TextEditingController toTimeController=TextEditingController();
  TextEditingController vehiclesController=TextEditingController();
  TextEditingController shipmentsNumberController=TextEditingController();
  TextEditingController noteController=TextEditingController();
  //
 ///pick time
  TimeOfDay selectedTime = TimeOfDay.now();
DateTime? fromTime;
  DateTime? toTime;

  Future<void> selectFromTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      fromTime= DateTime(
        DateTime.now().year,
        DateTime.now()
            .month,
        DateTime.now()
            .day,
        selectedTime.hour,
        selectedTime.minute,
      );
        selectedTime = picked;
        fromtimeController.text=picked.hour.toString()+':'+picked.minute.toString();
        notifyListeners();
    }
  }
  Future<void> selectToTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
     print( DateTime.now().toString());
      selectedTime = picked;
     toTime= DateTime(
       DateTime.now().year,
       DateTime.now()
           .month,
       DateTime.now()
           .day,
       selectedTime.hour,
       selectedTime.minute,
     );

      toTimeController.text=picked.hour.toString()+':'+picked.minute.toString();
      notifyListeners();
    }
  }

}