class SettingsApp {
  final String settingsName;
  String settingsValue;

  SettingsApp(
    this.settingsName,
    this.settingsValue,
  );

  factory SettingsApp.fromMap(
    final Map<String, dynamic> mapFilter,
  ) =>
      SettingsApp(
        mapFilter['settingsName'] as String,
        mapFilter['settingsValue'].toString(),
      );

  Map<String, Object?> toMap() => {
        'settingsName': settingsName,
        'settingsValue': settingsValue=='0'?'0':'1',
      };
}
