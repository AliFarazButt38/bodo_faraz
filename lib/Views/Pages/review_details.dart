import 'package:bodoo_flutter/Models/download_app_model.dart';
import 'package:bodoo_flutter/Models/write_review_model.dart';
import 'package:bodoo_flutter/Providers/download_apps_provider.dart';
import 'package:bodoo_flutter/Providers/write_review_provider.dart';
import 'package:bodoo_flutter/Theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Widgets/rating_dialogue.dart';
import 'notifications_Screen.dart';


class ReviewDetails extends StatefulWidget {
  WriteReviewModel reviewModel;
  ReviewDetails({required this.reviewModel});
  @override
  _ReviewDetailsState createState() => _ReviewDetailsState();
}




class _ReviewDetailsState extends State<ReviewDetails> {

  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
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

                          Text("Write a Review",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
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
                        Image.network(
                          widget.reviewModel.appIcon,
                          height: 90,
                          width: 90,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 8,),
                        Text(widget.reviewModel.appTitle,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Task Description',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),),
                            SizedBox(height: 10,),
                            Text(widget.reviewModel.appComment,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13,color: Palette.black25),),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
                                Provider.of<WriteReviewProvider>(context,listen: false).postReviewSubmit(widget.reviewModel.id,context);
                              },
                              child: Container(
                                height: 42,
                                width: 153,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Palette.baseElementGreen),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(child: Text('Mark as Done', style: TextStyle(color: Palette.baseElementBlue,fontSize: 16,fontWeight: FontWeight.w600),)),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                _launchUrl(Uri.parse(widget.reviewModel.appLink));
                                // await RatingDialog.show(context);
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
                                  width: 153,
                                  height: 42,
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







