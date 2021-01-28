import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notepad/view/home.dart';
import 'package:notepad/view/login.dart';
import 'package:provider/provider.dart';
import 'utility/current_user.dart';


void main() => runApp(NotepadApp());

/// Root widget of the application.
class NotepadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamProvider.value(
    initialData: CurrentUser.initial,
    value: FirebaseAuth.instance.onAuthStateChanged.map((user) => CurrentUser.create(user)),
    child: Consumer<CurrentUser>(
      builder: (context, user, _) => MaterialApp(
        title: 'Notepad',
        home: user.isInitialValue
            ? Scaffold(body: const Text('Loading...'))
            : user.data != null ? HomeScreen() : LoginScreen(),
      ),
    ),
  );
}