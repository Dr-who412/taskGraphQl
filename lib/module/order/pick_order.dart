
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/general_provider.dart';

import '../../utils/constatnt/app_consstant.dart';
import '../../utils/shared/network/graphQl_path.dart';
import '../../utils/widget/customContainer.dart';
import '../../utils/widget/custom_textfaild.dart';
import '../../utils/widget/toast.dart';

class PickOrder extends StatelessWidget {
  const PickOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text('Create PickUp'),
        centerTitle: true,
      ),
      body: Form(
        key: context.read<GeneralProvider>().creatPickUpKay,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(height: 22,),
              InkWell(
                onTap: (){
                  context.read<GeneralProvider>().selectFromTime(context);
                },
                child: CutemTextFaild(
                  raduis: 12,
                  validator: (value){
                    if(value?.isEmpty==true)return 'can not be empty!';
                  },
                  controler: context.read<GeneralProvider>().fromtimeController,
                  hint: 'From Time',
                  keyboard: TextInputType.datetime,
                  fillColor: Colors.black.withOpacity(.1),
                  useFillColor: true,
                  border: InputBorder.none,
                  enable: false,
                  sufxIcon: Icon(Icons.watch_later_outlined,color: Colors.grey),

                ),
              ),
              SizedBox(height: 22,),
              InkWell(
                onTap: (){
                  context.read<GeneralProvider>().selectToTime(context);
                },
                child: CutemTextFaild(
                  raduis: 12,
                  enable: false,
                  controler: context.read<GeneralProvider>().toTimeController,
                  hint: 'To Time',
                  keyboard: TextInputType.datetime,
                  validator: (value){
                    if(value?.isEmpty==true)return 'can not be empty!';
                  },
                  fillColor: Colors.black.withOpacity(.1),
                  useFillColor: true,
                  border: InputBorder.none,
                  sufxIcon: Icon(Icons.watch_later_outlined,color: Colors.grey),

                ),
              ),
              SizedBox(height: 22,),
              CutemTextFaild(
                raduis: 12,

                keyboard: TextInputType.number,
                validator: (value){
                  if(value?.isEmpty==true)return 'can not be empty!';
                },
                controler: context.read<GeneralProvider>().shipmentsNumberController,
                hint: 'Number of shipments',
                fillColor: Colors.black.withOpacity(.1),
                useFillColor: true,
                border: InputBorder.none,

              ),
              SizedBox(height: 22,),
              CutemTextFaild(
                raduis: 12,
                keyboard: TextInputType.number,
                validator: (value){
                  if(value?.isEmpty==true)return 'can not be empty!';
                },
                controler: context.read<GeneralProvider>().vehiclesController,
                hint: 'Vehicles',
                fillColor: Colors.black.withOpacity(.1),
                useFillColor: true,
                border: InputBorder.none,
              ),
              SizedBox(height: 22,),
              CutemTextFaild(
                raduis: 12,
validator: (value){
                  if(value?.isEmpty==true)return 'can not be empty!';
},
                controler: context.read<GeneralProvider>().noteController,
                hint: 'Notes',
                maxline: null,
                fillColor: Colors.black.withOpacity(.1),
                useFillColor: true,
                border: InputBorder.none,
              ),
              SizedBox(height: 22,),
              Mutation(

                options: MutationOptions(
                  document: gql(GraphQlPath.createPickUp),
                  onError: (e){
                    print(e);
                    showtoast(text: 'error',state: toastStates.ERROR);

                  },
                  onCompleted: (dynamic result) {
                    if(result!=null){
                      print('result: $result');
                      showtoast(text: 'success created',state: toastStates.SUCESS);

                    }else{
                      print('result: $result');
                      showtoast(text: 'error',state: toastStates.ERROR);

                    }
                  },
                ),
                builder: (
                    runMutation,
                    result,
                    ) {
                  return result?.isLoading==true?
                  Center(child: CircularProgressIndicator()):
                  InkWell(
                      onTap: () {
                       if(context.read<GeneralProvider>().creatPickUpKay.currentState?.validate()==true){
                          print("object");
                          //context.read<GeneralProvider>().performMutation();
                        //}

                        runMutation(
                          {
                            'customerId': int.parse( '12'),
                            'timeFrom':DateFormat('HH:mm').format(context.read<GeneralProvider>().fromTime!),
                            'timeTo':DateFormat('HH:mm').format(context.read<GeneralProvider>().toTime!),   // Replace with your actual date and time
                            'shipmentsCount': int.parse( '${context.read<GeneralProvider>().shipmentsNumberController.text}'),
                            'notes': '${context.read<GeneralProvider>().noteController.text}',
                            'branchId': int.parse( '5'),
                            'transactionTypeId':int.parse( '1'),
                          }
                        );
                       }
                      },
                      child: Card(
                          elevation: 4,
                          color: Colors.purpleAccent.withOpacity(.7),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Center(child: Text('Create!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                          ))
                  );
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
