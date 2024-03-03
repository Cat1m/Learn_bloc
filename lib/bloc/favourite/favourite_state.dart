// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:couter_bloc/utils/enums.dart';
import 'package:equatable/equatable.dart';

import 'package:couter_bloc/model/favourite_item_model.dart';

class FavouriteItemStates extends Equatable {
  final List<FavouriteItemModel> favouriteItemList;
  final List<FavouriteItemModel> temFavouriteItemList;
  final ListStatus listStatus;

  const FavouriteItemStates({
    this.temFavouriteItemList = const [],
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  @override
  List<Object?> get props =>
      [favouriteItemList, temFavouriteItemList, listStatus];

  FavouriteItemStates copyWith({
    List<FavouriteItemModel>? favouriteItemList,
    List<FavouriteItemModel>? temFavouriteItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteItemStates(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      temFavouriteItemList: temFavouriteItemList ?? this.temFavouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }
}
