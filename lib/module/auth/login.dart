import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/general_provider.dart';
import 'package:untitled/utils/constatnt/app_consstant.dart';

import '../../utils/shared/network/graphQl.dart';
import '../../utils/shared/network/graphQl_path.dart';
import '../../utils/widget/custom_textfaild.dart';
import '../order/pick_order.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 40),
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22)
          ),
          child: Container(
            height: MediaQuery.of(context).size.height/2,
            padding: EdgeInsets.all(12),
            child: Form(
              key: context.read<GeneralProvider>().loginKay,
              child: ListView(
                physics: BouncingScrollPhysics(),

                children: [
                  Text("LOGIN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 38,color: Colors.white),),
                  SizedBox(height: 18,),

                  CutemTextFaild(
                    controler: context.read<GeneralProvider>().userNameController,
                    hint: 'user',
                    useFillColor: true,
                    hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.purpleAccent)
                    ),
                    fillColor: Colors.white,
                  ),
                  SizedBox(height: 18,),
                  CutemTextFaild(

                    controler: context.read<GeneralProvider>().passwordController,
                    hint: 'password',
                    useFillColor: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),

                    ),
                    fillColor: Colors.white,
                  ),
                  SizedBox(height: 18,),

                  Mutation(
                    options: MutationOptions(
                      document: gql(GraphQlPath.login),
                      onCompleted: (dynamic result) {
                        if(result!=null){
                          print(result['login']['token']);
                          context.read<GeneralProvider>().setToken(token: result['login']['token']);
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PickOrder()));
                        }else{
                          print('result: $result');
                        }
                      },
                    ),
                    builder: (
                        runMutation,
                        result,
                        ) {
                      return result?.isLoading==true?Center(child: CircularProgressIndicator()): ElevatedButton(
                          onPressed: () {
    if(context.read<GeneralProvider>().loginKay.currentState?.validate()==true){
                            runMutation({
                            'username':context.read<GeneralProvider>().userNameController.text ,
                            'password': context.read<GeneralProvider>().passwordController.text,
                          });}
    },
                          child: Text('Login')
                      );
                    },
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
