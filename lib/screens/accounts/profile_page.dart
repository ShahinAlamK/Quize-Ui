import 'package:flutter/material.dart';
import 'package:quiz/style/fonts.dart';
import 'package:quiz/style/size_config.dart';
import '../../style/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  double coverPhotoHeight=200;
  double profilePictureHeight=120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kPrimary,
        title: Text("Profile",
          style: mediumText.copyWith(
              fontSize: SizeConfig.blockSizeHorizontal! * 6),
        ),
      ),

      body: ListView(
        physics:const BouncingScrollPhysics(),
        children: [
          profileHeader(),
          profileDetails()
        ],
      ),
    );
  }

  Widget buildContact(){
    return Container(
      height:80,
      width:SizeConfig.width,
      padding:const EdgeInsets.symmetric(horizontal: 10),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(10)
      ),
      child:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics:const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            RoundIcon(icon:Icons.call,onTap:(){}),
            RoundIcon(icon:Icons.mail,onTap:(){}),
            RoundIcon(icon:Icons.facebook,onTap:(){}),
            RoundIcon(icon:Icons.arrow_downward,onTap:(){}),
            RoundIcon(icon:Icons.link,onTap:(){}),
          ],
        ),
      ),
    );
  }
  Widget profileDetails() {
    return Container(
      margin:EdgeInsets.only(top:profilePictureHeight / 2),
      padding:const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 15),
          //Username
          Text("Shahin Alam Kiron",
            style: headingText.copyWith(
                fontSize: SizeConfig.blockSizeHorizontal! * 4.5,),
          ),
          //Bio Data or Title
          Text("Flutter Software Developer",maxLines:2,
            textAlign:TextAlign.center,overflow:TextOverflow.ellipsis,
            style: bodyText.copyWith(fontSize: SizeConfig.blockSizeHorizontal! *3),
          ),
          const SizedBox(height:10),
          //UserContact Information with Social Link
          buildContact(),
          const SizedBox(height: 15),
          //UserAbouts
          buildAbout(),
        ],
      ),
    );
  }
  Widget profileHeader() {
    return Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          backgroundImage(),
          Positioned(
            top:coverPhotoHeight - profilePictureHeight / 2,
            child: buildProfileImage(),
          )
        ]);
  }
  Widget buildProfileImage() {
    return Container(
      height:profilePictureHeight,
      width:profilePictureHeight,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(shape: BoxShape.circle, color: kSecondary),
      child: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80"),
      ),
    );
  }
  Widget backgroundImage() {
    return Container(
      height:coverPhotoHeight,
      width: SizeConfig.width,
      decoration: BoxDecoration(
          color: kBackground,
          image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1670767462967-5e048598ded2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"))),
    );
  }
  Widget buildAbout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Text("About",
            style:headingText.copyWith(fontSize: SizeConfig.blockSizeHorizontal! *4),
          ),
          const SizedBox(height: 10,),
          Text("Flutter Software Engineer and Google Developer Expert for Flutter & Dart. I'm Shahin Alam Kiron",
          textAlign: TextAlign.justify,
          style:bodyText.copyWith(fontSize:SizeConfig.blockSizeHorizontal!*3.5),)
        ],
      ),
    );
  }
}
class RoundIcon extends StatelessWidget {
  const RoundIcon({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius:BorderRadius.circular(5),
        child: Material(
          color:kBackground,
          child: InkWell(
            onTap:onTap,
            child: Container(
              padding:const EdgeInsets.all(10),
                decoration:const BoxDecoration(
                  color:Colors.transparent,
                ),
                child: Icon(icon)),
          ),
        ),
      ),
    );
  }
}
