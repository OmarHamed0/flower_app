import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/utils/bloc_observer/bloc_observer.dart';
import 'dependency_injection/di.dart';
import 'flower_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(const FlowerApp());
}
