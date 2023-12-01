import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/book/:bookId',
        builder: (context, state) => BookScreen(title: state.pathParameters["bookId"],),
      )
    ],
  );


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            final index = Random().nextInt(100);
            context.go("/book/${index}");
          },
          child: Text("Go to book"),
        ),
      ),
    );
  }
}



class BookScreen extends StatefulWidget {
  final String? title;
  const BookScreen({super.key, required this.title});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Livre N ${widget.title}"),
      ),
    );
  }
}
