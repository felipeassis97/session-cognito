import 'package:amplify_flutter/amplify_flutter.dart';

successLog(String message) => safePrint('\x1B[32m\u2714 $message\x1B[0m');
errorLog(String message) => safePrint('\x1B[31m\u2718 $message\x1B[0m');
