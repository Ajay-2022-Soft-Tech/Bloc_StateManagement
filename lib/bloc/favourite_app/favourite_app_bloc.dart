
import 'package:bloc/bloc.dart';

import '../../repository/favourite_repository.dart';
import '../model/favourite_item_model.dart';
import 'favourite_app_event.dart';
import 'favourite_app_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvents , FavouriteItemStates> {

  List<FavouriteItemModel> favouriteList = [];
  List<FavouriteItemModel> tempFavouriteList = [];

  FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemStates()){
  on<FetchFavouriteList>(fetchList);
  on<FavouriteItem>(_addFavouriteItem);
  on<SelectItem>(_selectItem);
  on<UnSelectItem>(_unSelectItem);
  on<DeleteItem>(_deleteItem);


  }

  void fetchList(FetchFavouriteList event, Emitter<FavouriteItemStates> emit)async{

      favouriteList = await favouriteRepository.fetchItem();
      emit(state.copyWith(favouriteItemList: List.from(favouriteList), listStatus: ListStatus.success));
  }

  void _addFavouriteItem(FavouriteItem events, Emitter<FavouriteItemStates> emit)async{

    final personIndex = favouriteList.indexWhere((person) => person.id == events.item.id);
    if(events.item.isFavourite){
      if(tempFavouriteList.contains(favouriteList[personIndex])){
        tempFavouriteList.remove(favouriteList[personIndex]);
        tempFavouriteList.add(events.item);
      }
    }else {
      if(tempFavouriteList.contains(favouriteList[personIndex])){
        tempFavouriteList.remove(favouriteList[personIndex]);
        tempFavouriteList.add(events.item);
      }
    }
    favouriteList[personIndex] = events.item;
    emit(state.copyWith(favouriteItemList: List.from(favouriteList) , tempFavouriteItemList: List.from(tempFavouriteList)));
  }
  void _selectItem(SelectItem event, Emitter<FavouriteItemStates> emit)async{

    tempFavouriteList.add(event.item);
    emit(state.copyWith(favouriteItemList: List.from(tempFavouriteList)));


  }
  void _unSelectItem(UnSelectItem event, Emitter<FavouriteItemStates> emit)async{

    tempFavouriteList.remove(event.item);
    emit(state.copyWith(tempFavouriteItemList: List.from(tempFavouriteList)));

  }

  void _deleteItem(DeleteItem event, Emitter<FavouriteItemStates> emit)async{

    for(int i =0 ;i<tempFavouriteList.length ;i++){
      favouriteList.remove(tempFavouriteList[i]);
    }

    tempFavouriteList.clear();
    emit(state.copyWith(
        favouriteItemList: List.from(favouriteList),
      tempFavouriteItemList:  List.from(tempFavouriteList)
    ));

  }
}
