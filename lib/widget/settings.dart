import 'package:flutter/material.dart';

import 'meeting_option.dart';
import 'package:jitsi_meet_fix/jitsi_meet.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _VideoCallState();
}

class _VideoCallState extends State<Settings> {
  //final AuthMethods _authMethods =AuthMethods();
  late TextEditingController  meetingIdController;
  late TextEditingController  nameController;
  // final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  bool isAudioMuted = true;
  bool isVideoMuted =true;

  @override
  void initState(){
    meetingIdController = TextEditingController();

    nameController = TextEditingController();
    super.initState();
  }

  @override

  void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    // jitsiMeet.removeAllListeners();
  }
 // _joinMeeting(){
 //   JitsiMeetMethods.createMeeting(
 //       roomName: meetingIdController.text,
 //       isAudioMuted:isAudioMuted ,
 //       isVideoMuted: isVideoMuted,
 //       username: nameController.text,
 //       IsModelMuted:
 //
 //
 //   );
 // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
 backgroundColor: Colors.orange,
        title: Text(
          'Join a Meeting',
          style: TextStyle(
            fontSize: 18,

          ),
        ),
        centerTitle: true
        ,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TextField(
              controller:meetingIdController ,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                // fillColor: secondaryBackgroundColor,
                filled: true,
                border: InputBorder.none,
                hintText: "Room ID",
                contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
              // fillColor:
            ),
          ), SizedBox(
            height: 60,
            child: TextField(
              controller:nameController ,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                // fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Name",
                  contentPadding: EdgeInsets.fromLTRB(16, 8, 0, 0)
              ),
              // fillColor:
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            // onTap: _joinMeeting,
            child: const Padding(
                padding:EdgeInsets.all(8),
            child: Text('join',style: TextStyle(fontSize: 16) ,),),
          ),
          const SizedBox(
            height: 20,
          ),
          MeetingOption(text: 'Mute Audio',isMute: isAudioMuted,
            onChange:onAudioMuted,),

          MeetingOption( text: 'Using Sign Language',isMute: isAudioMuted,
            onChange:UsingSignLang,),

          MeetingOption(text: 'Turn off My Video',isMute: isVideoMuted,
            onChange:onVideoMuted,)
        ],

      ),
    );

  }
  onAudioMuted (bool? val){
    setState(() {
      isAudioMuted=val!;

    }

    );
  }

  UsingSignLang (bool? val){
    setState(() {
      isAudioMuted=val!;

    }

    );
  }

  onVideoMuted (bool? val){
    setState(() {
      isVideoMuted=val!;

    }

    );
  }
}
