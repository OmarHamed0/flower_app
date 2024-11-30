import '../../common/common.dart';

/// to avoid using app localizations directly
/// and to avoid using context in the helper

/// use: LocalizationHelper.localizations.[key]
class LocalizationHelper{
  LocalizationHelper._();
  static late AppLocalizations localizations;
  /// this method call only once in start of app
  static void init(BuildContext context){
    localizations = AppLocalizations.of(context)!;
  }
}