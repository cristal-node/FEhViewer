import 'dart:io';

import 'package:eros_fe/common/service/ehsetting_service.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';
import 'package:vibration/vibration_presets.dart';

import 'logger.dart';

final VibrateUtil vibrateUtil = VibrateUtil();

class VibrateUtil {
  VibrateUtil();

  EhSettingService get _ehSettingService => Get.find();

  Future<void> impact() async {
    if (_ehSettingService.vibrate.value || await Vibration.hasVibrator()) {
      if (await Vibration.hasAmplitudeControl()) {
        Vibration.vibrate(duration: 2);
      } else {
        Vibration.vibrate(preset: VibrationPreset.softPulse);
      }
    }
  }

  Future<void> light() async {
    if (_ehSettingService.vibrate.value || await Vibration.hasVibrator()) {
      if (await Vibration.hasAmplitudeControl()) {
        Vibration.vibrate(amplitude:100, duration: 5);
      } else {
        Vibration.vibrate(preset: VibrationPreset.softPulse);
      }
    }
  }

  Future<void> medium() async {
    if (_ehSettingService.vibrate.value || await Vibration.hasVibrator()) {
      if (await Vibration.hasAmplitudeControl()) {
        Vibration.vibrate(amplitude:120, duration: 15);
      } else {
        Vibration.vibrate(preset: VibrationPreset.softPulse);
      }
    }
  }

  Future<void> heavy() async {
    if (_ehSettingService.vibrate.value || await Vibration.hasVibrator()) {
      if (await Vibration.hasAmplitudeControl()) {
        Vibration.vibrate(amplitude:255, duration: 10);
      } else {
        Vibration.vibrate(preset: VibrationPreset.softPulse);
      }
    }
  }

  Future<void> success() async {
    if (_ehSettingService.vibrate.value || await Vibration.hasVibrator()) {
      Vibration.vibrate(preset: VibrationPreset.softPulse);
    }
  }

  Future<void> error() async {
    if (_ehSettingService.vibrate.value || await Vibration.hasVibrator()) {
      Vibration.vibrate(preset: VibrationPreset.heartbeatVibration);
    }
  }
}
