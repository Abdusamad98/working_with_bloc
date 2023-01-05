import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/album/album_cubit.dart';
import 'package:working_with_bloc/bloc/calculator/calculator_cubit.dart';
import 'package:working_with_bloc/bloc/counter/counter_cubit.dart';
import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/repositories/album_repo.dart';
import 'package:working_with_bloc/ui/albums/albums_screen.dart';
import 'package:working_with_bloc/ui/calculator_page/calculator_page.dart';
import 'package:working_with_bloc/ui/counter_page/counter_page.dart';
import 'package:working_with_bloc/ui/counter_page/counter_with_value.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(0),
        ),
        BlocProvider(
          create: (context) => CalculatorCubit(),
        ),
        BlocProvider(
          create: (context) => AlbumCubit(AlbumRepos(apiService: ApiService()))..fetchAllAlbums(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AlbumsScreen(),
    );
  }
}
