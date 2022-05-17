import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lectly_client_user_mobile/src/constants/colors.dart';
import 'package:lectly_client_user_mobile/src/widgets/background_container_widget.dart';
import 'package:lectly_client_user_mobile/src/widgets/main_screen_app_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:audio_session/audio_session.dart';




class MainScreen extends StatefulWidget {

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

  const theSource = AudioSource.microphone;

class _MainScreenState extends State<MainScreen> {



  Codec _codec = Codec.aacMP4;
  String _mPath = 'tau_file.mp4';
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mRecorderIsInited = false;



  @override
  void initState() {
    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _mRecorder!.closeRecorder();
    _mRecorder = null;
    super.dispose();
  }

  Future<void> openTheRecorder() async {
    await _mRecorder!.openRecorder();
    if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
      _codec = Codec.opusWebM;
      _mPath = 'tau_file.webm';
      if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
      AVAudioSessionCategoryOptions.allowBluetooth |
      AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
      AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

  void record() {
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {});
    });
  }

  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Stack(
          children: [
            Positioned(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Appbar(),
                    ),
                    const SizedBox(height: 137,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            "Hold to record",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontFamily: "Cairo",
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        GestureDetector(
                          onTapDown: (detail) async {

                            if (!(await Permission.microphone.request().isGranted)) {
                              return;
                            }else if (await Permission.microphone.isPermanentlyDenied) {
                              openAppSettings();
                            }else
                              Map<Permission, PermissionStatus> statuses = await [
                                Permission.microphone,
                              ].request();

                              record(); // the error is failed to handled method call when audio session is opened
                          },
                          onTapUp: (detail) async{
                            stopRecorder();
                          },

                          child: Column (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 128,
                                width: 128,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/images/ellipse.png"),
                                      fit: BoxFit.fill),
                                ),
                                child: Image.asset('assets/images/mic.png'),

                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              ),

            ),

          ],
        ),
      ),
    );
  }

}


