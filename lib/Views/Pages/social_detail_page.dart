import 'package:bodoo_flutter/Models/download_app_model.dart';
import 'package:bodoo_flutter/Models/socialmedia_model.dart';
import 'package:bodoo_flutter/Providers/download_apps_provider.dart';
import 'package:bodoo_flutter/Providers/socialMedia_provider.dart';
import 'package:bodoo_flutter/Theme/palette.dart';
import 'package:bodoo_flutter/Views/Pages/webview_instagram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:launch_review/launch_review.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'notifications_Screen.dart';


class SocialDetailPage extends StatefulWidget {
  SocialMediaModel socialMediaModel;
  bool check;
  SocialDetailPage({required this.socialMediaModel,required this.check});
  @override
  _SocialDetailPageState createState() => _SocialDetailPageState();
}




class _SocialDetailPageState extends State<SocialDetailPage> {

  Future<void> _launchUrl(Uri _url) async {

    if (!await launchUrl(_url,mode: LaunchMode.externalApplication,)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Provider.of<DownloadAppsProvider>(context,listen: false).getDownloadAppUrls();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 500,
                  width:MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    // color: Colors.blueAccent,
                    gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child:ImageIcon(AssetImage("assets/icons/backward.png",),size: 30,color: Colors.white,),
                          ),

                          Text("Social Task",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                          SizedBox()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),



            Positioned.fill(
              top: 120,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding:  EdgeInsets.only(left: 30.0,right: 30,top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image.network(
                        //   widget.socialMediaModel.,
                        //   height: 90,
                        //   width: 90,
                        //   fit: BoxFit.fill,
                        // ),
                        // SizedBox(height: 8,),
                        Text(widget.socialMediaModel.action,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Task Description',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: 10,),
                            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Palette.black25),),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                if(widget.check == false){
                                  Provider.of<SocialMediaProvider>(context,listen: false).postInstagramBot(context,widget.socialMediaModel.id);

                                }else{
                                  Provider.of<SocialMediaProvider>(context,listen: false).PostFacebookBot(context,widget.socialMediaModel.id);

                                }

                                // Provider.of<DownloadAppsProvider>(context,listen: false).postDownloadApp(widget.appModel.id.toString(), context);
                              },
                              child: Container(
                                height: 42.h,
                                width: 153.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.baseElementGreen),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(child: Text('Mark as Done', style: TextStyle(color: Palette.baseElementBlue,fontSize: 16,fontWeight: FontWeight.w600),)),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewInstagramTask(socialMediaModel: widget.socialMediaModel)));

                                 _launchUrl(Uri.parse(widget.socialMediaModel.url));
                                //  StoreRedirect.redirect(
                                //    androidAppId: "com.iyaffle.rangoli",
                                //    iOSAppId: "585027354",
                                //  );
                                // LaunchReview.launch(androidAppId: 'com.le03da199687.app',
                                //     iOSAppId: "585027354",writeReview: false);
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient:
                                    const LinearGradient(colors: [Palette.baseElementBlue, Palette.baseElementGreen]),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                  width: 153.w,
                                  height: 42.h,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Start Task',
                                    style:
                                    const TextStyle(fontSize: 18, ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}







