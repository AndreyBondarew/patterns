void main(List<String> arguments) {
  ThemeBuilderContract builder = ThemeBuilder();
  ThemeDirector director = ThemeDirector();
  director.buildDarkTheme(builder);
  Theme theme = builder.build();
  print(theme);
  Theme theme1 = (ThemeBuilder()..setBackgroundColor(0x171717)..setForegroundColor(0xa7a7a7)..setTextColor(0xcacaca)).build();
  print(theme1);
}

class Theme {
  int backgroundColor;
  int foregroundColor;
  int textColor;
  bool useTransparency;
  double textSize;

  Theme({required this.backgroundColor, required this.foregroundColor, required this.textColor, required this.useTransparency, required this.textSize});

  @override
  String toString() => 'BG color = $backgroundColor, FG color = $foregroundColor, TXT color = $textColor, TRS = $useTransparency, TXT size = $textSize';
}

abstract class ThemeBuilderContract {
  void setBackgroundColor(int color);

  void setForegroundColor(int color);

  void setTextColor(int color);

  void setUseTransparency(bool transparency);

  void setTextSize(double textSize);

  Theme build();
}

class ThemeBuilder implements ThemeBuilderContract {
  int? _backgroundColor, _foregroundColor, _textColor;
  bool? _isUseTransparency;
  double? _textSize;

  @override
  void setBackgroundColor(int color) {
    _backgroundColor = color;
  }

  @override
  void setForegroundColor(int color) {
    _foregroundColor = color;
  }

  @override
  void setTextColor(int color) {
    _textColor = color;
  }

  @override
  void setTextSize(double textSize) {
    _textSize = textSize;
  }

  @override
  void setUseTransparency(bool transparency) {
    _isUseTransparency = transparency;
  }

  @override
  Theme build() {
    return Theme(
      backgroundColor: _backgroundColor ?? 0x000000,
      foregroundColor: _foregroundColor ?? 0xffffff,
      textColor: _textColor ?? 0xffffff,
      useTransparency: _isUseTransparency ?? false,
      textSize: _textSize ?? 12.0,
    );
  }
}

class ThemeDirector{
  void buildDarkTheme(ThemeBuilderContract builder){
    builder.setBackgroundColor(0x000000);
    builder.setForegroundColor(0xf9f9f9);
    builder.setTextColor(0xcacaca);
    builder.setUseTransparency(false);
    builder.setTextSize(11.0);
  }

  void buildLightTheme(ThemeBuilderContract builder){
    builder.setBackgroundColor(0xfafafa);
    builder.setForegroundColor(0x000000);
    builder.setTextColor(0x070707);
    builder.setUseTransparency(false);
    builder.setTextSize(13.0);
  }
  void buildModernTheme(ThemeBuilderContract builder){
    builder.setBackgroundColor(0x0a0a0c);
    builder.setForegroundColor(0xf8f9fa);
    builder.setTextColor(0xcacaca);
    builder.setUseTransparency(true);
    builder.setTextSize(12.0);
  }
}
