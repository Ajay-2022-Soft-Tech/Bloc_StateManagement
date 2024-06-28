import 'package:equatable/equatable.dart';
import '../model/favourite_item_model.dart';


enum ListStatus{loading , success , failure}

class FavouriteItemStates extends Equatable {

  final List<FavouriteItemModel> favouriteItemList ;
  final List<FavouriteItemModel> tempFavouriteItemList ;

  final ListStatus listStatus;
  const FavouriteItemStates({
    this.favouriteItemList = const [],
    this.tempFavouriteItemList = const [],
    this.listStatus = ListStatus.loading
});

  // Create a new instance of this class FavouriteItemState with modified
  FavouriteItemStates copyWith({List<FavouriteItemModel>? favouriteItemList, List<FavouriteItemModel>? tempFavouriteItemList, ListStatus? listStatus}){
    return FavouriteItemStates(
        favouriteItemList: favouriteItemList ?? this. favouriteItemList,
        tempFavouriteItemList: tempFavouriteItemList ?? this. tempFavouriteItemList,
        listStatus: listStatus ?? this.listStatus

    );
    }
  @override
  List<Object?> get props => [favouriteItemList,listStatus,tempFavouriteItemList,];


}