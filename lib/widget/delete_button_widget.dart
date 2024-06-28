import 'package:bloc_state_management/bloc/favourite_app/favourite_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favourite_app/favourite_app_bloc.dart';
import '../bloc/favourite_app/favourite_app_event.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteBloc, FavouriteItemStates>(
      buildWhen: (previous, current) =>  previous.tempFavouriteItemList != current.tempFavouriteItemList,
      builder: (context, state) {
        return Visibility(
            visible: state.tempFavouriteItemList.isNotEmpty ?  true : false ,
            child: IconButton(onPressed: () {
              context.read<FavouriteBloc>().add(DeleteItem());
            },
                icon: const Icon(Icons.delete_outline , color: Colors.red,))
        );
      },
    );
  }
}