import 'development.dart' as Development;
import 'production.dart' as Production;

const bool isPro = false;

Object env = isPro ? Production.Config() : Development.Config();
