import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:linkify_app/core/api/api_keys.dart';
import 'package:linkify_app/core/dependency_injection.dart';
import 'package:linkify_app/core/prefs.dart';
import 'package:linkify_app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.initSharedPreferences();
  setupServiceLocator();
  Stripe.publishableKey = ApiKeys.publishableKey;
  runApp(const MyApp());
}
