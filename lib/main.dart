import 'package:adote_patinhas/app/modules/login/domain/usecases/login_with_email_and_password_usecase.dart';
import 'package:adote_patinhas/app/modules/login/repositories/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/app.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerFactory(
      () => LoginRepository(firebaseAuth: FirebaseAuth.instance));
  runApp(const MyApp());
}
