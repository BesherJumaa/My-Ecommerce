class SettingsModel {
  String? settingsId;
  String? settingsTitlehome;
  String? settingsTitlehomeAr;
  String? settingsBodyhome;
  String? settingsBodyhomeAr;

  SettingsModel(
      {this.settingsId,
      this.settingsTitlehome,
      this.settingsTitlehomeAr,
      this.settingsBodyhome,
      this.settingsBodyhomeAr});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    settingsId = json['settings_id'];
    settingsTitlehome = json['settings_titlehome'];
    settingsTitlehomeAr = json['settings_titlehome_ar'];
    settingsBodyhome = json['settings_bodyhome'];
    settingsBodyhomeAr = json['settings_bodyhome_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['settings_id'] = settingsId;
    data['settings_titlehome'] = settingsTitlehome;
    data['settings_titlehome_ar'] = settingsTitlehomeAr;
    data['settings_bodyhome'] = settingsBodyhome;
    data['settings_bodyhome_ar'] = settingsBodyhomeAr;
    return data;
  }
}
