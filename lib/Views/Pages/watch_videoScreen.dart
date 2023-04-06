import 'package:bodoo_flutter/Providers/level_provider.dart';
import 'package:bodoo_flutter/Providers/video_provider.dart';
import 'package:bodoo_flutter/Theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'Play_video.dart';
import 'notifications_Screen.dart';

class ListItem {
  final String image;
  final String title;
  final String description;
  ListItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
List<ListItem> items = [
  ListItem(
    image: "assets/images/camera2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
  ListItem(
    image: "assets/images/camera2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
  ListItem(
    image: "assets/images/camera2.png",
    title: "Add a Title to your Video",
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it",
  ),
];


class WatchVideo extends StatefulWidget {
  const WatchVideo({Key? key}) : super(key: key);

  @override
  State<WatchVideo> createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<VideoProvider>(context,listen: false).getWatchVideos(context);
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

                          Text("Video Tasks",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                          InkWell
                            (
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                              },
                              child: ImageIcon(AssetImage('assets/icons/notification.png',),size: 25,color: Colors.white,)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
       Positioned.fill(
         top: 140,
         child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
            color: Colors.white,
          ),
           child: Padding(
             padding: const EdgeInsets.only(top: 70),
             child: Consumer<VideoProvider>(

               builder: (context, videoProvider,child) {
                 if(videoProvider.videoLoading){
                   return Center(child: CircularProgressIndicator(color: Palette.baseElementBlue,));
                 }else if(videoProvider.videosList.isNotEmpty){
                   return SingleChildScrollView(
                     child: Column(
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             children: [
                               ListView.separated(
                                 physics: BouncingScrollPhysics(),
                                 scrollDirection: Axis.vertical,
                                 shrinkWrap: true,
                                 itemCount: videoProvider.videosList.length,
                                 separatorBuilder: (BuildContext context,int index){
                                   return SizedBox(height: 20,);
                                 },// Replace itemCount with the actual number of list items you want to display
                                 itemBuilder: (context, index) {
                                  // final item = videoProvider.videosList[index];
                                   return InkWell(
                                     onTap: () {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayVideo(videoModel: videoProvider.videosList[index],)));
                                     },
                                     child: Container(
                                       padding: EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 8),
                                       decoration: BoxDecoration(
                                         color: Colors.white,
                                         borderRadius: BorderRadius.circular(15),
                                         boxShadow: [
                                           BoxShadow(
                                             color: Colors.grey.withOpacity(0.5),
                                             spreadRadius: 2,
                                             blurRadius: 5,
                                             offset: Offset(0, 3),
                                           ),
                                         ],
                                       ),
                                       child: Column(
                                         crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                           Stack(
                                             children: [
                                               ClipRRect(
                                                 borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                                                 child: Image.network(
                                                   videoProvider.videosList[index].thumbnail,
                                                   height: 250,
                                                   width: MediaQuery.of(context).size.width,
                                                   fit: BoxFit.cover,

                                                 ),
                                               ),
                                               Positioned
                                                 (
                                                 child: Center(child: Padding(
                                                   padding: const EdgeInsets.only(top: 60),
                                                   child: Image.asset("assets/images/videoIcon.png",height: 100,width: 100,),
                                                 )),

                                               ),
                                             ],
                                           ),
                                           SizedBox(height: 16),
                                           Padding(
                                             padding: const EdgeInsets.only(left: 15),
                                             child: Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children:[
                                                 Text(
                                                   videoProvider.videosList[index].title,
                                                   maxLines: 2,
                                                   overflow: TextOverflow.ellipsis,
                                                   style: TextStyle(
                                                     fontSize: 16,
                                                     fontWeight: FontWeight.w600,
                                                   ),
                                                 ),
                                                 SizedBox(height: 16),
                                                 Text(
                                                   'Description',
                                                   maxLines: 3,
                                                   overflow: TextOverflow.ellipsis,
                                                   style: TextStyle(
                                                     fontSize: 14,
                                                     color: Colors.black,
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           SizedBox(height: 16),
                                           Padding(
                                             padding: const EdgeInsets.only(left: 55),
                                             child: ElevatedButton(
                                               onPressed: () {
                                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayVideo(videoModel: videoProvider.videosList[index],)));
                                               },
                                               style: ElevatedButton.styleFrom(
                                                   padding: EdgeInsets.zero,
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.circular(20))),
                                               child: Ink(
                                                 decoration: BoxDecoration(
                                                     gradient:
                                                     const LinearGradient(colors: [Colors.blueAccent, Colors.greenAccent]),
                                                     borderRadius: BorderRadius.circular(10)),
                                                 child: Container(
                                                   width: 250,
                                                   height: 47,
                                                   alignment: Alignment.center,
                                                   child: const Text(
                                                     'Watch Video',
                                                     style:
                                                     const TextStyle(fontSize: 18, ),
                                                   ),
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   );
                                 },
                               ),
                             ],
                           ),
                         ),

                       ],
                     ),
                   );
                 }else{
                   return Center(child: Text('No Video'));
                 }

               }
             ),
           ),
      ),
       ),


            Positioned(
              top: 90,
              left: 10,
              right: 10,
              child: Consumer<LevelProvider>(

                builder: (context, levelProvider, child) {
                  return Container(
                    width: 388.w,
                    height: 100,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 9,
                          offset: Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  [
                                  Text("Watch Videos",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                                  Text("${levelProvider.completedVideos}/${levelProvider.totalVideos}"),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: LinearPercentIndicator(
                                  barRadius: Radius.circular(15.0),
                                  animation: true,
                                  lineHeight: 12,
                                  percent: levelProvider.totalVideos == 0 ?  levelProvider.completedVideos/1 : levelProvider.completedVideos/levelProvider.totalVideos,

                                  // progressColor: Colors.blueAccent,
                                  linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                                  backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                                ),
                              ),
                              SizedBox(height: 5,),
                              Text("Watch Videos to Earn points",style: TextStyle(color: Colors.grey,fontSize: 15)),
                            ],
                          ),
                        ),
                        // subtitle: Padding(
                        //   padding: const EdgeInsets.only(top: 20),
                        //   child: Column(
                        //     children: [
                        //       LinearPercentIndicator(
                        //         barRadius: Radius.circular(15.0),
                        //         animation: true,
                        //         lineHeight: 12,
                        //         percent: 0.7,
                        //         // progressColor: Colors.blueAccent,
                        //         linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                        //         backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,
                        //       ),
                        //       SizedBox(height: 5,),
                        //       Text("Watch Videos to Earn points",style: TextStyle(color: Colors.grey,fontSize: 15)),
                        //     ],
                        //   ),
                        // ),

                        leading: Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                          child: Column(
                            children: const [
                              ImageIcon(AssetImage('assets/icons/video.png',),size: 25,color: Colors.black,),
                            ],

                          ),
                        ),


                        onTap: () {
                        },
                      ),
                    ),

                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
