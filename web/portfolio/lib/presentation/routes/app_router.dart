// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:go_router/go_router.dart';
import 'package:portfolio/presentation/features/about/about_screen.dart';
import 'package:portfolio/presentation/features/books/books_screen.dart';
import 'package:portfolio/presentation/features/contact/contact_screen.dart';
import 'package:portfolio/presentation/features/home/home_screen.dart';
import 'package:portfolio/presentation/features/uikits/ui_kits_screen.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => AboutScreen(),
    ),
    GoRoute(
      path: '/contact',
      builder: (context, state) => ContactScreen(),
    ),
    GoRoute(
      path: '/books',
      builder: (context, state) => BooksScreen(),
    ),
    GoRoute(
      path: 'uikits',
      builder: (context, state) => UIKitsScreen(),
    ),
  ],
);
