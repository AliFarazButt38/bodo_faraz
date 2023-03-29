import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'notifications_Screen.dart';

class ContainerData {
  final String image;
  final String text;
  final String description;

  ContainerData({required this.image, required this.text,required this.description});
}

List<ContainerData> containerDataList = [
  ContainerData(
   image:'assets/images/TwitchReview.png',
    text: 'Add a Title to your Video',
    description: 'Lorem Ipsum is simply dummy text of the ',

  ),
  ContainerData(
    image: 'assets/images/TedxReview.png',
    text: 'Add a Title to your Video',
    description: 'Lorem Ipsum is simply dummy text of the ',
  ),
  ContainerData(
    image: 'assets/images/McdonaldsReview.png',
    text: 'Add a Title to your Video',
    description: 'Lorem Ipsum is simply dummy text of the ',
  ),
  ContainerData(
    image: 'assets/images/ImdbReview.png',
    text: 'Add a Title to your Video',
    description: 'Lorem Ipsum is simply dummy text of the ',
  ),
];

class WriteReview extends StatefulWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  State<WriteReview> createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
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


                          Text("Review",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
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
        top: 150,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: 428,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
              color: Colors.white,
            ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80,left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Write a review",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
                        SizedBox(height: 5,),
                        Text("Earn points on giving review",style: TextStyle(fontSize: 18,color: Colors.grey),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: containerDataList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              height: 100,
                              width: 388,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset(
                                      containerDataList[index].image,
                                      height: 80,
                                      width: 80,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          containerDataList[index].text,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 5,),
                                          Text(
                                            containerDataList[index].description,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12,),

                                          ),

                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            ImageIcon(AssetImage("assets/icons/star.png",),color: Colors.grey,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 5,top: 5),
                                              child: Text("Give Review to earn Points",style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
        
      ),

            Positioned(
              top: 100,
              left: 13,
              child: Container(
                width: 370,
                height: 90,
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
                      padding: const EdgeInsets.only(bottom: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Write a Review",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w600),),
                          Text("41/60",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    subtitle: LinearPercentIndicator(
                      barRadius: Radius.circular(15.0),
                      animation: true,
                      lineHeight: 12,
                      percent: 0.7,
                      // progressColor: Colors.blueAccent,
                      linearGradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                      backgroundColor:Color.fromRGBO(220, 220, 220, 1) ,

                    ),
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 8.0,top: 18.0),
                      child: Column(
                        children: const [
                          ImageIcon(AssetImage('assets/icons/review.png',),size: 21,color: Colors.black,),
                        ],
                      ),
                    ),
                    onTap: () {
                    },
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
