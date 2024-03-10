import 'package:circlify/screens/add_postscreen.dart';
import 'package:circlify/screens/feedback_screen.dart';
import 'package:circlify/screens/profile_screen.dart';
import 'package:circlify/screens/search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

const webScreenSize = 600;

List<Widget> screen = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid)
];
