import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz/controllers/quiz_controller.dart';
import 'package:quiz/style/app_strings.dart';
import 'package:quiz/style/fonts.dart';
import '../../style/app_colors.dart';
import '../../style/size_config.dart';
import '../accounts/profile_page.dart';
import 'quiz_body.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().inti(context);
    final quizProvider=Provider.of<QuizController>(context);
    return Scaffold(
      key:quizProvider.globalKey,
      backgroundColor: kBackground,

      appBar:AppBar(
        backgroundColor:kPrimary,
        centerTitle:false,
        elevation:0,
        automaticallyImplyLeading: false,
        title: Text(AppString.appName,
        style:mediumText.copyWith(fontSize:SizeConfig.blockSizeHorizontal!*5.5),),
        actions: [

          IconButton(onPressed:(){
           quizProvider.endDrawerOpen();
          },icon:const Icon(Icons.menu,size: 30,)),
          const SizedBox(width: 10,)
        ],
      ),

      endDrawer:const CustomDrawer(),

      body:const QuizBody(),

    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().inti(context);
    return SizedBox(
      width: SizeConfig.width!/1.5,
      child: Drawer(
        backgroundColor:kPrimary,
        child:Column(
          mainAxisAlignment:MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height:SizeConfig.height!/5.9,
                    child: DrawerHeader(
                      margin:const EdgeInsets.symmetric(horizontal: 15),
                        decoration:BoxDecoration(
                          color:kBackground,
                          borderRadius:BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(AppString.appName,
                            style:headingText.copyWith(fontSize:SizeConfig.blockSizeHorizontal!*6),),
                            Text("version : 1.0.2",
                            style:smallText.copyWith(fontSize:SizeConfig.blockSizeHorizontal!*3),),
                          ],
                        )),
                  ),
                  const SizedBox(height:10),
                  Divider(color:kBackground,thickness: 1,endIndent: 10,indent: 10),
                  //Accounts
                  ListTile(
                    leading:Icon(Icons.person,color:kSecondary,),
                    title:Text("Accounts",style:mediumText.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal!*4,
                        color:kSecondary
                    ),),
                    onTap:(){
                      Navigator.pop(context);
                     Navigator.push(context,MaterialPageRoute(builder:(_)=>const ProfilePage()));}
                  ),
                  //Themes
                  ListTile(
                    leading:Icon(Icons.tungsten,color:kSecondary,),
                    title:Text("Theme",style:mediumText.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal!*4,
                      color:kSecondary
                    ),),
                    trailing:Switch(value: false, onChanged: (value){}),
                  ),
                  //Developer
                  ListTile(
                    leading:Icon(Icons.developer_board_sharp,color:kSecondary,),
                    title:Text("Developer",style:mediumText.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal!*4,
                      color:kSecondary
                    ),),
                  ),
                  //Trams & Condition
                  ListTile(
                    leading:Icon(Icons.info_outline,color:kSecondary,),
                    title:Text("Trams & Condition",style:mediumText.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal!*4,
                        color:kSecondary
                    ),),
                  ),
                  //signOut
                  ListTile(
                    leading:Icon(Icons.exit_to_app,color:kSecondary,),
                    title:Text("Sign Out",style:mediumText.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal!*4,
                        color:kSecondary
                    ),),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                //Call Icon
                RoundIcon(icon: Icons.call, onTap:(){Navigator.pop(context);}),
                //Facebook Icon
                RoundIcon(icon: Icons.facebook, onTap:(){Navigator.pop(context);}),
                //Telegram
                RoundIcon(icon: Icons.telegram, onTap:(){Navigator.pop(context);}),
              ],
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

