// import 'package:assets_audio_player/assets_audio_player.dart';

// import 'package:audioplayers/audio_cache.dart';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class AudioManager {
  AudioCache audioCache = AudioCache();
  static AudioPlayer player = AudioPlayer();
  Uint8List? soundbytes;
  static Future openAudio() async {
    // audioCache.prefix.
    // String audioasset = "assets/bgm/bgm.mp3";
    // ByteData bytes = await rootBundle.load(audioasset); //load sound from assets
    // soundbytes =
    //     bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    // if (soundbytes != null) await player.setSourceBytes(soundbytes!);
    player.setReleaseMode(ReleaseMode.loop);
    // player.setPlayerMode(PlayerMode.mediaPlayer);

    // if (result == 1) {
    //   //play success
    //   print("Sound playing successful.");
    // } else {
    //   print("Error while playing sound.");
    // }
  }

  static Future play() async {
    await AudioManager.openAudio();

    // await player.setPlayerMode(PlayerMode.lowLatency);
    // await player.
    print("playing");
    // if (soundbytes != null) await player.playBytes(soundbytes!);
    await player.play(AssetSource("bgm/bgm.mp3"));

    //  await player.play;
    // assetsAudioPlayer.playOrPause();
  }

  static Future pause() async {
    print("pause");
    await player.pause();

// You can pasue the player
// int result = await player.pause();

// if(result == 1){ //stop success
//     print("Sound playing stopped successfully.");
// }else{
//     print("Error on while stopping sound.");
// }
  }

  static Future dispose() async {
    await player.dispose();
  }

  static Future resume() async {
    print("resume");
    await player.resume();
  }
}
