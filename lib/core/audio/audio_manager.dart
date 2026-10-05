import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

/// Uygulama genelinde ses efektlerini yönetir.
class AudioManager {
  // Singleton pattern
  AudioManager._internal();
  static final AudioManager instance = AudioManager._internal();

  final AudioPlayer _sfxPlayer = AudioPlayer();
  final AudioPlayer _bgmPlayer = AudioPlayer();

  bool _soundEnabled = true;
  bool _musicEnabled = true;

  bool get soundEnabled => _soundEnabled;
  bool get musicEnabled => _musicEnabled;

  // ─── Ses Efektleri ────────────────────────────────

  /// Kısa efekt sesi çal
  Future<void> playSfx(String fileName) async {
    if (!_soundEnabled) return;
    try {
      await _sfxPlayer.stop();
      await _sfxPlayer.play(AssetSource('audio/sfx/$fileName'));
    } catch (e) {
      debugPrint('❌ Ses çalınamadı: $fileName → $e');
    }
  }

  /// Doğru cevap sesi
  Future<void> playCorrect() => playSfx('correct.wav');

  /// Yanlış cevap sesi
  Future<void> playWrong() => playSfx('wrong.wav');

  /// Buton tıklama sesi
  Future<void> playTap() => playSfx('tap.wav');

  /// Kutlama sesi
  Future<void> playCelebration() => playSfx('celebration.wav');

  // ─── Arka Plan Müziği ─────────────────────────────

  Future<void> startBgm([String fileName = 'garden_theme.mp3']) async {
    if (!_musicEnabled) return;
    try {
      await _bgmPlayer.setReleaseMode(ReleaseMode.loop);
      await _bgmPlayer.setVolume(0.3);
      await _bgmPlayer.play(AssetSource('audio/bgm/$fileName'));
    } catch (e) {
      debugPrint('❌ BGM çalınamadı: $e');
    }
  }

  Future<void> stopBgm() async {
    await _bgmPlayer.stop();
  }

  Future<void> pauseBgm() async {
    await _bgmPlayer.pause();
  }

  Future<void> resumeBgm() async {
    if (!_musicEnabled) return;
    await _bgmPlayer.resume();
  }

  // ─── Ayarlar ──────────────────────────────────────

  void toggleSound() {
    _soundEnabled = !_soundEnabled;
    if (!_soundEnabled) _sfxPlayer.stop();
  }

  void toggleMusic() {
    _musicEnabled = !_musicEnabled;
    if (_musicEnabled) {
      resumeBgm();
    } else {
      pauseBgm();
    }
  }

  Future<void> dispose() async {
    await _sfxPlayer.dispose();
    await _bgmPlayer.dispose();
  }
}
