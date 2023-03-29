
import 'package:flutter/material.dart';

class ContainerData {
  final String image;
  final String text;
  final String time;
  final String refrel;

  ContainerData({required this.image, required this.text,required this.time,required this.refrel});
}

List<ContainerData> containerDataList = [
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
  ContainerData(
    image: 'assets/icons/splash.png',
    text: 'Your invite',
    refrel: "has been send",
    time: "2h ago",
  ),
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
  ContainerData(
    image:'assets/icons/profile.png',
    text: 'Ainal Aimaz',
    refrel: "used your refrrel",
    time: "2h ago",
  ),
];
class ContainerData2{
  final String image;
  final String text;
  final String time;
  final String refrel;

  ContainerData2({required this.image, required this.text,required this.time,required this.refrel});
}


List<ContainerData> containerDataList2 = [
ContainerData(
image:'assets/icons/profile.png',
text: 'Ainal Aimaz',
refrel: "used your refrrel",
time: "3 March,2023 at 3:44 PM",
),
];

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                          InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: ImageIcon(AssetImage("assets/icons/backward.png",),size: 30,color: Colors.white,)),

                          Text("Notifications",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                          ImageIcon(AssetImage('assets/icons/settings.png',),size: 30,color: Colors.white,),
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
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,top: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Today",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Text("You have",style: TextStyle(color: Colors.black,fontSize: 20),),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 5.0,left: 5.0),
                                        child: Text("3 Notifications",style: TextStyle(color: Colors.blueAccent,fontSize: 20),),
                                      ),
                                      Text("today",style: TextStyle(color: Colors.black,fontSize: 20),),
                                    ],
                                  ),
                                ],
                              ),

                            ),
                            SizedBox(height: 30,),

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: containerDataList.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Container(
                                        height: 100,
                                        width: 90,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    containerDataList[index].image,
                                                    height: 70,
                                                    width: 70,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10,top: 10),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(

                                                                containerDataList[index].text,
                                                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                                                                maxLines: 2,
                                                                overflow: TextOverflow.ellipsis,
                                                              ),

                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 5),
                                                                child: Text(

                                                                  containerDataList[index].refrel,style: TextStyle(fontSize: 18),
                                                                maxLines: 2,
                                                                  overflow: TextOverflow.ellipsis,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Text(
                                                            containerDataList[index].time,
                                                            style: TextStyle(color: Colors.grey,fontSize: 18)),

                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10,right: 10),
                                              child: Divider(thickness: 1,height: 1,),
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

                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Text("Yesterday",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: containerDataList2.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    height: 80,
                                    width: 90,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            containerDataList2[index].image,
                                            height: 70,
                                            width: 70,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10,top: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        containerDataList2[index].text,
                                                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                                                      ),

                                                      Padding(
                                                        padding: const EdgeInsets.only(left: 5),
                                                        child: Text(containerDataList2[index].refrel,style: TextStyle(fontSize: 18),),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Text(
                                                    containerDataList2[index].time,
                                                    style: TextStyle(color: Colors.grey,fontSize: 18),
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
                            ),
                          ],
                        ),
                      ],
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