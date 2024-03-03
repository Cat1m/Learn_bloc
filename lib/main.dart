import 'package:couter_bloc/bloc/counter/counter_bloc.dart';
import 'package:couter_bloc/bloc/favourite/favourite_bloc.dart';
import 'package:couter_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:couter_bloc/bloc/posts/posts_bloc.dart';
import 'package:couter_bloc/bloc/switch/switch_bloc.dart';
import 'package:couter_bloc/bloc/todo/to_do_bloc.dart';
import 'package:couter_bloc/repository/favourite_repository.dart';
import 'package:couter_bloc/ui/image/image_picker_screen.dart';
import 'package:couter_bloc/ui/posts/posts_screen.dart';
import 'package:couter_bloc/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => ToDoBloc()),
        BlocProvider(create: (_) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (_) => PostBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
        ),
        home: const PostsScreen(),
      ),
    );
  }
}
