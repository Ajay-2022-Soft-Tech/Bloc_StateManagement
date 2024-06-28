import 'package:bloc_state_management/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_event.dart';
import 'package:bloc_state_management/bloc/favourite_app/favourite_app_state.dart';
import 'package:bloc_state_management/bloc/model/favourite_item_model.dart';
import 'package:bloc_state_management/widget/delete_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {

  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteList());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text('Favourite App'),
        centerTitle: true,
        backgroundColor: Colors.grey[400],
        actions: [
         DeleteButtonWidget()
        ],

      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(child: CircularProgressIndicator())
                  ],
                );


              case ListStatus.failure:
                return Text('Something went wrong');

              case ListStatus.success:
                return ListView.builder(
                    itemCount: state.favouriteItemList.length,
                    itemBuilder: (context, index) {
                      final item = state.favouriteItemList[index];
                      return Card(
                        child: ListTile(
                          leading: Checkbox(
                            value: state.tempFavouriteItemList.contains(item)
                                ? true
                                : false,
                            onChanged: (value) {
                              if (value!) {
                                context.read<FavouriteBloc>().add(
                                    SelectItem(item: item));
                              }
                              else {
                                context.read<FavouriteBloc>().add(
                                    UnSelectItem(item: item));
                              }
                            },
                          ),
                          title: Text(item.value.toString()),
                          trailing: IconButton(
                            onPressed: () {
                              FavouriteItemModel itemModel = FavouriteItemModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true,

                              );
                              context.read<FavouriteBloc>().add(
                                  FavouriteItem(item: itemModel));
                            },
                            icon: Icon(
                                item.isFavourite ? Icons.favorite : Icons
                                    .favorite_outline),
                          ),
                        ),
                      );
                    });
            }
          },

        ),
      ),

    );
  }
}
