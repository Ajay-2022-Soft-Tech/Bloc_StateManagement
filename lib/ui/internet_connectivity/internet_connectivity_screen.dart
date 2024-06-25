import 'package:bloc_state_management/bloc/internet_connectivity/internet_bloc.dart';
import 'package:bloc_state_management/bloc/internet_connectivity/internet_bloc.dart';
import 'package:bloc_state_management/bloc/internet_connectivity/internet_state.dart';
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
          BlocConsumer<InternetBloc,InternetState>(
              listener: (context,state){
                if(state is InternetGainedState){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Center(child: Text('Internet Connected')),
                      backgroundColor: Colors.green,
                    )
                  );

                }
                else if (state is InternetLostState){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Internet Not Connected'),
                        backgroundColor: Colors.red,
                      )
                  );
                }

              },

              builder: (context,state){
                if(state is InternetGainedState){
                  return Center(child: Text('Connected',style: TextStyle(fontSize: 40)));
                }
                else if (state is InternetLostState){
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
