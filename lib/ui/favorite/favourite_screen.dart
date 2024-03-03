import 'package:couter_bloc/bloc/favourite/favourite_bloc.dart';
import 'package:couter_bloc/bloc/favourite/favourite_event.dart';
import 'package:couter_bloc/bloc/favourite/favourite_state.dart';
import 'package:couter_bloc/model/favourite_item_model.dart';
import 'package:couter_bloc/utils/enums.dart';
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
      appBar: AppBar(
        title: const Text("Favourite App"),
        actions: [
          BlocBuilder<FavouriteBloc, FavouriteItemStates>(
            builder: (context, state) {
              return Visibility(
                visible: state.temFavouriteItemList.isNotEmpty ? true : false,
                child: IconButton(
                    onPressed: () {
                      context.read<FavouriteBloc>().add(DeleteItem());
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.deepPurple,
                    )),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavouriteBloc, FavouriteItemStates>(
            builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Text("Something went wrong");
            case ListStatus.success:
              return ListView.builder(
                  //physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: state.favouriteItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favouriteItemList[index];
                    return Card(
                      child: ListTile(
                        leading: Checkbox(
                          value: state.temFavouriteItemList.contains(item)
                              ? true
                              : false,
                          onChanged: (value) {
                            if (value!) {
                              context
                                  .read<FavouriteBloc>()
                                  .add(SelectItem(item: item));
                            } else {
                              context
                                  .read<FavouriteBloc>()
                                  .add(UnSelectItem(item: item));
                            }
                          },
                        ),
                        title: Text(item.value.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            FavouriteItemModel itemModel = FavouriteItemModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true);
                            context
                                .read<FavouriteBloc>()
                                .add(FavouriteItem(item: itemModel));
                          },
                          icon: Icon(
                            item.isFavourite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: item.isFavourite
                                ? Colors.deepPurple
                                : Colors.grey,
                          ),
                        ),
                      ),
                    );
                  });
          }
        }),
      ),
    );
  }
}
