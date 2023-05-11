import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../Providers/subscription_provider.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({Key? key}) : super(key: key);

  @override
  State<SubscriptionPlan> createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {

  final List<Widget> _containerList = [
    Container(
      width: 292,
      height: 537,
      decoration: BoxDecoration(
        color: Colors.transparent,


      ),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            child: Container(
              height: 134.6,
              width: 292,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              
                gradient: LinearGradient(colors: [Color(0xffEAB705),Color(0xffDC8A03)]),

              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text("Basic",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$10",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                        Text("/Month",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 90,
            child: Stack(
              children: [
                Image.asset("assets/icons/yellowcircle.png",height: 100,width: 100,),
                Positioned(
                  child:
                  Padding(
                    padding:  EdgeInsets.only(left: 25,top: 20,),
                    child: Image.asset("assets/icons/yellowStar.png",height:50,width:50,),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient:
                          LinearGradient(colors: [Color(0xffEAB705),Color(0xffDC8A03)]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: 250,
                        height: 44,
                        alignment: Alignment.center,
                        child:  Text(
                          'Get Started',
                          style:
                          TextStyle(fontSize: 18,fontWeight: FontWeight.w600 ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: 292,
      height: 537,
      decoration: BoxDecoration(
        color: Colors.transparent,

      ),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            child: Container(
              height: 134.6,
              width: 292,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                gradient: LinearGradient(colors: [Color(0xff407BFF),Color(0xff1737AF)]),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text("Standard",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$10",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                        Text("/Month",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 90,
            child: Stack(
              children: [
                Image.asset("assets/icons/BlueCircle.png",height: 100,width: 100,),
                Positioned(
                  child:
                  Padding(
                    padding:  EdgeInsets.only(left: 25,top: 25,),
                    child: Image.asset("assets/icons/2star.png",height:50,width:50,),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient:
                          LinearGradient(colors: [Color(0xff407BFF),Color(0xff1737AF)]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: 250,
                        height: 44,
                        alignment: Alignment.center,
                        child:  Text(
                          'Get Started',
                          style:
                          TextStyle(fontSize: 18,fontWeight: FontWeight.w600 ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    Container(
      width: 292,
      height: 537,
      decoration: BoxDecoration(
        color: Colors.transparent,

      ),
      child: Stack(
        children: [
          Positioned(
            top: 40,
            child: Container(
              height: 134.6,
              width: 292,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                gradient: LinearGradient(colors: [Color(0xffE10049),Color(0xffB9003C)]),
              ),
              child: Padding(
                padding:  EdgeInsets.only(top: 70),
                child: Column(
                  children: [
                    Text("Premium",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("\$10",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                        Text("/Month",style: TextStyle(color: Colors.white,fontSize: 18),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 90,
            child: Stack(
              children: [
                Image.asset("assets/icons/PinkCircle.png",height: 100,width: 100,),
                Positioned(
                  child:
                  Padding(
                    padding:  EdgeInsets.only(left: 18,top: 15,),
                    child: Image.asset("assets/icons/premiumStar.png",height:70,width:70,),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 180,
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/true.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("you will get this Feature"),
                      Padding(
                        padding: const EdgeInsets.only(left: 50),
                        child: Image.asset("assets/icons/false.png",width: 8.17,height: 7,),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient:
                          LinearGradient(colors: [Color(0xffE10049),Color(0xffB9003C)]),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        width: 250,
                        height: 44,
                        alignment: Alignment.center,
                        child:  Text(
                          'Get Started',
                          style:
                          TextStyle(fontSize: 18,fontWeight: FontWeight.w600 ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ];
  @override
  void initState() {
    super.initState();
    Provider.of<SubscriptionPlanProvider>(context,listen: false).getSubscriptionPlan(context);
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:
        Padding(
          padding:  EdgeInsets.only(top: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){
                      Navigator.pop(context);

                    }, icon: Icon(Icons.arrow_back)),
                    Text("Subscription Plan",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),),
                  ],
                ),
                SizedBox(height: 50.h,),
                Text("Choose Your Plan",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25.sp),),
                SizedBox(height: 30.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Start with",style: TextStyle(fontSize: 16.sp),),
                    Text(" 14 days free trial",style: TextStyle(fontSize: 16.sp,color: Color(0xff2341B3),),),
                    Text(" upgrade or",style: TextStyle(fontSize: 16.sp),),
                  ],
                ),
                Text("downgrade anytime",style: TextStyle(fontSize: 16.sp),),
                SizedBox(height: 70.h,),
                CarouselSlider(
                  items: _containerList,
                  options: CarouselOptions(
                    height: 537,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
