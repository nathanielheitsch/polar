import 'dart:io';

/// Features available in Polar BLE SDK library
enum PolarBleSdkFeature {
  /// Hr feature to receive hr and rr data from Polar or any other BLE device
  /// via standard HR BLE service
  hr,

  /// Device information feature to receive sw information from Polar or any
  /// other BLE device
  deviceInfo,

  /// Feature to receive battery level info from Polar or any other BLE device
  batteryInfo,

  /// Polar sensor streaming feature to stream live online data. For example
  /// hr, ecg, acc, ppg, ppi, etc...
  onlineStreaming,

  /// Polar offline recording feature to record offline data to Polar device
  /// without continuous BLE connection.
  offlineRecording,

  /// H10 exercise recording feature to record exercise data to Polar H10
  /// device without continuous BLE connection.
  h10ExerciseRecording,

  /// Feature to read and set device time in Polar device
  deviceTimeSetup,

  /// In SDK mode the wider range of capabilities are available for the online
  /// stream or offline recoding than in normal operation mode.
  sdkMode;

  static const _featureStringMap = {
    hr: 'FEATURE_HR',
    deviceInfo: 'FEATURE_DEVICE_INFO',
    batteryInfo: 'FEATURE_BATTERY_INFO',
    onlineStreaming: 'FEATURE_POLAR_ONLINE_STREAMING',
    offlineRecording: 'FEATURE_POLAR_OFFLINE_RECORDING',
    h10ExerciseRecording: 'FEATURE_POLAR_H10_EXERCISE_RECORDING',
    deviceTimeSetup: 'FEATURE_POLAR_DEVICE_TIME_SETUP',
    sdkMode: 'FEATURE_POLAR_SDK_MODE',
  };

  static final _stringFeatureMap =
      _featureStringMap.map((k, v) => MapEntry(v, k));

  /// Create a [PolarBleSdkFeature] from json
  static PolarBleSdkFeature fromJson(dynamic json) {
    if (Platform.isIOS) {
      return PolarBleSdkFeature.values[json as int];
    } else {
      // This is android
      return _stringFeatureMap[json as String]!;
    }
  }

  /// Convert a [PolarBleSdkFeature] to json
  dynamic toJson() {
    if (Platform.isIOS) {
      return PolarBleSdkFeature.values.indexOf(this);
    } else {
      // This is Android
      return _featureStringMap[this]!;
    }
  }
}
