import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../features/auth/providers/auth_provider.dart';
import '../features/startup/providers/startup_provider.dart';
import '../features/student/providers/student_provider.dart';
import '../features/applications/providers/application_provider.dart';
import '../features/bookmarks/providers/bookmark_provider.dart';
import '../features/notifications/providers/notification_provider.dart';

class AppProviders {
  static List<SingleChildWidget> get providers => [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => StartupProvider()),
        ChangeNotifierProvider(create: (_) => StudentProvider()),
        ChangeNotifierProvider(create: (_) => ApplicationProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
      ];
}
