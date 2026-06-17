

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

Future<void> signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();

  // بعد تسجيل الخروج يرجع لصفحة تسجيل الدخول
  Navigator.pushReplacementNamed(context, '/login');
}

