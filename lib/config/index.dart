import 'development.dart' as Development;
import 'production.dart' as Production;

const bool isPro = false;

Map<String, dynamic> env = isPro ? Production.Config : Development.Config;
