import 'package:bloc_state_management/bloc/counter/counter_bloc.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_state_management/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_state_management/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_state_management/bloc/todo/to_do_bloc.dart';
import 'package:bloc_state_management/cubit/internet_bloc/internet_cubit.dart';
import 'package:bloc_state_management/repository/favourite_repository.dart';
import 'package:bloc_state_management/ui/favourite_app/favourite_app_screen.dart';
import 'package:bloc_state_management/utils/image_picker_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CounterBloc() ),
          BlocProvider(create: (_) => SwitchBloc() ),
          BlocProvider(create: (_) => InternetCubit() ),
          BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils()) ),
          BlocProvider(create: (_) => ToDoBloc() ),
          BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository() )),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            color: Colors.grey[400],

            theme: ThemeData(
            ),
            home: FavouriteAppScreen()

          //


        ),
    );

  }
}


