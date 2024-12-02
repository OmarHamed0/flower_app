import 'package:flower_app/common/common.dart';

extension StringExtenstion on String?{
  /// check this string [value] is empty or null
  bool isNullOrEmpty()=> this == null || this == "";
}

/// Context Extension to get height and width of the screen
/// usage: context.height, context.width
extension ContextExtension on BuildContext {
  /// Get height of context screen
  /// usage: context.height
  double get height => MediaQuery.of(this).size.height;
  /// Get width of context screen
  /// usage: context.width
  double get width => MediaQuery.of(this).size.width;
}