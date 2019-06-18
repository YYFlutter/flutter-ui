import 'development.dart' as Development;
import 'production.dart' as Production;

const bool isPro = false;
const String owner_repo = 'efoxTeam/flutter-ui';

Object env = isPro ? Production.Config() : Development.Config();
