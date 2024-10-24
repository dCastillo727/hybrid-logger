import 'package:hybrid_logger/hybrid_logger.dart';

final _defaultColors = {
  LogTypeEntity.critical: AnsiPen()..xterm(198),
  LogTypeEntity.error: AnsiPen()..red(),
  LogTypeEntity.warning: AnsiPen()..yellow(),
  LogTypeEntity.info: AnsiPen()..blue(),
  LogTypeEntity.debug: AnsiPen()..gray(),
  LogTypeEntity.success: AnsiPen()..xterm(49),
  LogTypeEntity.stacktrace: AnsiPen()..xterm(214),
  LogTypeEntity.httpRequest: AnsiPen()..xterm(012),
  LogTypeEntity.httpResponse: AnsiPen()..xterm(49),
  LogTypeEntity.httpError: AnsiPen()..red(),
};

class HybridSettings {
  HybridSettings({
    Map<LogTypeEntity, AnsiPen>? colors,
    this.type = LogTypeEntity.info,
    this.lineSymbol = '─',
    this.maxLineWidth = 60,
    this.showLines = true,
    this.showHeaders = true,
    this.forceLogs = false,
  }) {
    if (colors != null) {
      _defaultColors.addAll(colors);
    }
    this.colors.addAll(_defaultColors);
  }

  final Map<LogTypeEntity, AnsiPen> colors = _defaultColors;

  final LogTypeEntity type;
  final String lineSymbol;
  final int maxLineWidth;
  final bool showLines;
  final bool showHeaders;
  final bool forceLogs;

  HybridSettings copyWith({
    Map<LogTypeEntity, AnsiPen>? colors,
    LogTypeEntity? type,
    String? lineSymbol,
    int? maxLineWidth,
    bool? showLines,
    bool? showHeaders,
    bool? forceLogs,
  }) {
    return HybridSettings(
      colors: colors ?? this.colors,
      type: type ?? this.type,
      lineSymbol: lineSymbol ?? this.lineSymbol,
      maxLineWidth: maxLineWidth ?? this.maxLineWidth,
      showLines: showLines ?? this.showLines,
      showHeaders: showHeaders ?? this.showHeaders,
      forceLogs: forceLogs ?? this.forceLogs,
    );
  }
}
