import 'development.dart' as Development;
import 'production.dart' as Production;

const bool isPro = true;

Map<String, dynamic> env = isPro ? Production.Config : Development.Config;
