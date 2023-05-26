import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Paymob_integ/payment_provider.dart';
import '../../Paymob_integ/reference_screen.dart';
import '../../Paymob_integ/visa_webview.dart';
import '../../Providers/write_review_provider.dart';
import '../../Theme/palette.dart';
class ContainerData {
  final String image;
  final String text;
  final String description;

  ContainerData({required this.image, required this.text,required this.description});
}

List<ContainerData> containerDataList = [
  ContainerData(
    image:'assets/icons/refrel.png',
    text: 'Pay with Referral Code ',
    description: 'Done your payment with referral code and pay money. ',

  ),
  ContainerData(
    image: 'assets/icons/credit-debit.png',
    text: 'Pay with Credit/Debit Card',
    description: 'Done payment with your mobile in an instant payment',
  ),
  ContainerData(
    image: 'assets/icons/wallet.png',
    text: 'Pay with Bodo Wallet',
    description: 'Use your wallet money to done with your payments. ',
  ),
];


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 347.h,
                  width:428.w,
                  decoration: const BoxDecoration(
                    // color: Colors.blueAccent,
                    gradient: LinearGradient(colors: [Colors.blueAccent,Colors.greenAccent]),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 50.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child:Image.asset("assets/icons/backward.png",height: 30.h,width: 30.w,),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left: 100),
                          child: Text("Payment",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25.sp),),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: 120,
              child: Container(
                height: 790.h,
                width: 428.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(20.0),topRight: Radius.circular(20.0),
                  ),
                  color: Colors.white,
                ),
                       child:
                       Column(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Padding(
                             padding:  EdgeInsets.only(top: 20),
                             child: ListView.builder(
                             // physics: NeverScrollableScrollPhysics(),
                             scrollDirection: Axis.vertical,
                             shrinkWrap: true,
                             itemCount:containerDataList.length,
                             itemBuilder: (BuildContext context, int index) {
                               return InkWell(
                                 onTap: (){
                                   if(index == 0){
                                     Provider.of<PaymentProvider>(context,listen: false).getRefCode();
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => ReferenceScreen()));
                                   }else  if(index == 1){
                                     Navigator.push(context, MaterialPageRoute(builder: (context) => VisaWebview()));
                                   }else if(index == 2){
                                     Provider.of<PaymentProvider>(context,listen: false).getMobileWalletUrl();
                                   }
                                   // Navigator.push(context, MaterialPageRoute(builder: (context) => ReviewDetails(reviewModel: reviewProvider.reviewsList[index])));

                                   // Navigator.push(context, MaterialPageRoute(builder: (context) => WebviewReview(reviewModel: reviewProvider.reviewsList[index])));

                                 },
                                 child: Container(
                                   margin: EdgeInsets.all(10),
                                   height: 100.h,
                                   width: 380.w,
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
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     // crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Padding(
                                         padding: const EdgeInsets.only(left: 5),
                                         child: Image.asset(
                                          containerDataList[index].image,
                                           height: 50,
                                           width: 50,
                                         ),
                                       ),
                                       Padding(
                                         padding: const EdgeInsets.only(top: 5),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             SizedBox(height: 20,),
                                             Text(
                                               containerDataList[index].text,
                                               style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                                             ),
                                             SizedBox(height: 10,),
                                             Text(
                                               containerDataList[index].description,
                                               maxLines: 2,
                                               //overflow: TextOverflow.ellipsis,
                                               style: TextStyle(fontSize: 12.sp,),
                                               overflow: TextOverflow.ellipsis,
                                             ),


                                           ],
                                         ),
                                       ),
                                       Padding(
                                         padding:  EdgeInsets.only(right: 20),
                                         child: Image.asset('assets/icons/pay.png',height: 12,width: 6,),
                                       ),



                                     ],
                                   ),
                                 ),
                               );

                 }
             ),
                           ),
                           Padding(
                             padding: EdgeInsets.only(left: 20.0.w,right: 20.w,bottom: 20.h),
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
                                     'Next',
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

          ],
        ),
      ),
    );
  }
}