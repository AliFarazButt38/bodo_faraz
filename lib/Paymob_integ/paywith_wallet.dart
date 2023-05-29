import 'package:bodoo_flutter/Paymob_integ/payment_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Theme/palette.dart';


class PayWithWallet extends StatefulWidget {
  const PayWithWallet({Key? key}) : super(key: key);

  @override
  State<PayWithWallet> createState() => _PayWithWalletState();
}

class _PayWithWalletState extends State<PayWithWallet> {
  TextEditingController phoneController = TextEditingController();
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
              child: Padding(
                padding:  EdgeInsets.only(top: 30,left: 10,right: 10),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: phoneController,
                      style: TextStyle(
                        color: Palette.grey,
                        fontSize: 14.sp,
                      ),
                      // onChanged: (value) {
                      //   setState(() {
                      //     emailController.text = value.toString();
                      //   });
                      // },
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        //add prefix icon
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/email.svg',
                            semanticsLabel: 'A red up arrow',
                          ),
                        ),

                        // errorText: _errorMsg,
                        //  disabledBorder: OutlineInputBorder(
                        //    borderSide: const BorderSide(color: Palette.grey),
                        //    borderRadius: BorderRadius.circular(10),
                        //  ),
                        border:  OutlineInputBorder(
                          borderSide: const BorderSide(color: Palette.black),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Palette.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Palette.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        fillColor: Palette.grey,

                        hintText: "Phone Number",

                        //make hint text
                        hintStyle: TextStyle(
                          color: Palette.grey,
                          fontSize: 14,
                        ),

                        //create lable
                        labelText: 'Phone Number',
                        //lable style
                        labelStyle: TextStyle(
                          color: Palette.grey,
                          fontSize: 14,
                        ),
                      ),
                      validator: (text) {
                        if(text!.isEmpty){
                          return 'Enter Referal code';
                        }
                        // else if (text.length != 11) {
                        //   return 'number should be 11 digits';
                        // }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<PaymentProvider>(context,listen: false).getMobileWalletUrl(phoneController.text);
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