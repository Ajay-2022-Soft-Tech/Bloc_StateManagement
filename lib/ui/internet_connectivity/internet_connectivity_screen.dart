import 'package:bloc_state_management/cubit/internet_bloc/internet_cubit.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetConnectivityScreen extends StatelessWidget {
  const InternetConnectivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Internet Connectivity'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          // Block Consumer is used as both for showing UI and background process eg , Snackbar , Text
          BlocConsumer<InternetCubit,InternetState>(
              listener: (context,state){
                if(state == InternetState.Gained){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Center(child: Text('Internet Connected')),
                      backgroundColor: Colors.green,
                    )
                  );

                }
                else if (state ==InternetState.Lost){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Internet Not Connected'),
                        backgroundColor: Colors.red,
                      )
                  );
                }

              },

              builder: (context,state){
                if(state == InternetState.Gained){
                  return Center(child: Text('Connected',style: TextStyle(fontSize: 40)));
                }
                else if (state == InternetState.Lost){
                  return Center(child: Text('Not Connected',style: TextStyle(fontSize: 40)));
                }
                else{
                  return Center(child: Text('Loading...',style: TextStyle(fontSize: 40)));
                }
              },

          )
        ],
      ),
    );
  }
}
