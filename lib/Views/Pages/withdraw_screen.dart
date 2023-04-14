import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Theme/palette.dart';

List<Map<String, dynamic>> items = [
  {    'image': 'assets/icons/dollar.png',    'text': '\$100',  },
  {    'image': 'assets/icons/dollar.png',    'text': '\$200',  },
  {    'image': 'assets/icons/dollar.png',    'text': '\$300',  },
  {    'image': 'assets/icons/dollar.png',    'text': '\$400',  },
  {    'image': 'assets/icons/dollar.png',    'text': '\$500',  },
  {    'image': 'assets/icons/dollar.png',    'text': '\$600',  },
  {    'image': 'assets/icons/dollar.png',    'text': '\$700',  },
  {    'image': 'assets/icons/dollar.png',    'text': '\$800',  },
];


class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  TextEditingController _withdrawController = TextEditingController();
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      body: SafeArea(child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 347.h,
                width:428.w,
                decoration: const BoxDecoration(
                  // color: Colors.blueAccent,
                  gradient:
                  LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff1737AF),Color(0xff24EFA0),Color(0xff24EFA0)]

                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
                  child: Row(
                    // mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Image.asset("assets/icons/backward.png",height: 30.h,width: 30.w,),
                      Padding(
                        padding:  EdgeInsets.only(left: 120.w),
                        child: Text("Withdraw",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),
                        textAlign: TextAlign.center,
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 150,
            child: Container(
              height: 695.h,
              width: 428.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 20.w,right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 150.h,),
                    Text("Add value",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Color(0xff263238)),),
                    SizedBox(height: 10.h,),
                    TextField(
                      controller: _withdrawController,
                      decoration: InputDecoration(
                        hintText: 'Minimum 100\$',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
                    Text("Select amount to withdraw",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Color(0xff263238)),),
                    SizedBox(height: 20.h,),
                    GridView.count(
                      crossAxisCount: 4, // 4 containers per row
                      mainAxisSpacing: 30, // vertical spacing between rows
                      crossAxisSpacing: 20, // horizontal spacing between containers
                      childAspectRatio: 1,
                      shrinkWrap: true,// width:height ratio for each container is 1:1
                      children: List.generate(8, (index) {
                        bool isSelected = index == _selectedIndex;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                            height: 150.h,
                            width: 82.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: isSelected ? Colors.greenAccent : Colors.white,
                                width: 2,
                              ),

                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(1, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  items[index]['image'],
                                  height: 30.h,
                                  width: 30.w,
                                  color: isSelected ? Colors.greenAccent : null,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  items[index]['text'],
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected ? Colors.greenAccent : null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 30.h,),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {

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
                            width: 388.w,
                            height: 56.h,
                            alignment: Alignment.center,
                            child:  Text(
                              'Withdraw \$200',
                              style:
                              TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600 ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
           top: 100,
            left: 20,
            child: Container(
              height: 172.h,
              width: 388.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(1, 0),
                  ),
                ],
                color:Color(0xffFFFFFF),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 10.h,left: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Current Cash",style: TextStyle(color: Color(0xffC4C4C4),fontSize: 16.sp,fontWeight: FontWeight.w600),),
                    Text("\$200",style: TextStyle(color: Color(0xff363636),fontSize: 32.sp,fontWeight: FontWeight.w600),),
                    Text("Level 1 has been Completed you can\n now Withdraw",style: TextStyle(color: Color(0xff363636),fontSize: 14.sp,fontWeight: FontWeight.w600),),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),),
    );
  }
}
