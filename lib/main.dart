import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:working_with_bloc/app/app.dart';
import 'package:working_with_bloc/app/app_bloc_observer.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  runApp(App());
}
