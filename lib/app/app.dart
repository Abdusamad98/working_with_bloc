import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/bloc/single_state/single_state_bloc.dart';
import 'package:working_with_bloc/cubit/calculator/calculator_cubit.dart';
import 'package:working_with_bloc/cubit/counter/counter_cubit.dart';
import 'package:working_with_bloc/data/api_service/api_service.dart';
import 'package:working_with_bloc/data/repositories/album_repo.dart';
import 'package:working_with_bloc/ui/albums/view/albums_screen.dart';
import 'package:working_with_bloc/ui/cards/cards_screen.dart';
import 'package:working_with_bloc/ui/single_state_view/SingleStateView.dart';
import 'package:working_with_bloc/ui/text_editor/view/text_editor_screen.dart';
import 'package:working_with_bloc/ui/users/users_screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AlbumRepos(
            apiService: ApiService(),
          ),
        ),
        RepositoryProvider(
          create: (context) => ApiService(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CounterCubit(0),
          ),
          BlocProvider(
            create: (context) => CalculatorCubit(),
          ),
          BlocProvider(
            create: (context) => SingleStateBloc(),
          ),
        ],
        child: MyApp(),
      ),
    );
  }
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
      home: UsersScreen(),
    );
  }
}
