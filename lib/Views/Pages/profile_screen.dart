import 'package:bodoo_flutter/Providers/auth_provider.dart';
import 'package:bodoo_flutter/Views/Pages/notifications_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController referralController = TextEditingController();

final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController=TextEditingController();

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)){
      return 'Enter Valid Email';
    }
    else if(value.isEmpty){
      return 'Enter Email';
    }else {
      return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var user = Provider.of<AuthProvider>(context,listen: false).user;
    if(user != null){
      emailController = TextEditingController(text:  user.email);
      nameController = TextEditingController(text: user.name);
      contactController = TextEditingController(text: user.number);
      referralController = TextEditingController(text: user.referralLink);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
      Stack(
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
                  padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text("Profile",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25),),
                        InkWell(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Notifications()));
                           },
                            child:
                            ImageIcon
                              (AssetImage
                              ('assets/icons/notification.png',),size: 25,color: Colors.white,)

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 150,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),topLeft: Radius.circular(20.0)),
                color: Colors.white,
              ),
            child: SingleChildScrollView(
              child: Consumer<AuthProvider>(

                builder: (context, authProvider, child) {
                  return Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 70),
                        child: Column(
                          children: [
                            Text(authProvider.user != null ? authProvider.user!.name : '',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 22),),
                            Text("Level 2 - Grade 3",style: TextStyle(fontSize: 16),),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
                              child: Column(
                                children: [
                                  TextFormField(
                                    readOnly: true,
                                    controller: referralController,
                                    decoration: InputDecoration(
                                      labelText: 'Reference Link',
                                      hintText:authProvider.user != null ? authProvider.user!.referralLink : '',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blueAccent),
                                      ),
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(right: 15),
                                        child: Container(
                                            height: 20,
                                            width: 20,
                                            child: Image.asset("assets/icons/forward.png",)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,top: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Personal Information",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                            Form
                              (
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20,right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextFormField(
                                    readOnly: true,
                                    controller: nameController,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    // onChanged: (value) {
                                    //   setState(() {
                                    //     emailController.text = value.toString();
                                    //   });
                                    // },
                                    decoration: InputDecoration(
                                     // hintText:authProvider.user != null ? authProvider.user!.name : '',

                                      focusColor: Colors.white,
                                      //add prefix icon

                                      // errorText: _errorMsg,
                                      //  disabledBorder: OutlineInputBorder(
                                      //    borderSide: const BorderSide(color: Palette.grey),
                                      //    borderRadius: BorderRadius.circular(10),
                                      //  ),
                                      border:  OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color:  Colors.blueAccent),
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
                                      fillColor: Colors.grey,

                                    //  hintText: "Name",

                                      //make hint text
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),

                                      //create lable
                                      labelText: 'Name',
                                      //lable style
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    validator:(text) {
                                      if(text!.isEmpty){
                                        return 'enter name';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    controller: emailController,
                                    readOnly: true,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    // onChanged: (value) {
                                    //   setState(() {
                                    //     emailController.text = value.toString();
                                    //   });
                                    // },
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon


                                      // errorText: _errorMsg,
                                      //  disabledBorder: OutlineInputBorder(
                                      //    borderSide: const BorderSide(color: Palette.grey),
                                      //    borderRadius: BorderRadius.circular(10),
                                      //  ),
                                      border:  OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
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
                                      fillColor: Colors.grey,

                                     // hintText:authProvider.user != null ? authProvider.user!.email : '',


                                      //make hint text
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),

                                      //create lable
                                      labelText: 'Email',
                                      //lable style
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    validator: validateEmail,
                                  ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    readOnly: true,
                                    controller: contactController,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    // onChanged: (value) {
                                    //   setState(() {
                                    //     emailController.text = value.toString();
                                    //   });
                                    // },
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      //add prefix icon


                                      // errorText: _errorMsg,
                                      //  disabledBorder: OutlineInputBorder(
                                      //    borderSide: const BorderSide(color: Palette.grey),
                                      //    borderRadius: BorderRadius.circular(10),
                                      //  ),
                                      border:  OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.blueAccent),
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
                                      fillColor: Colors.grey,

                                     // hintText:authProvider.user != null ? authProvider.user!.number : '',


                                      //make hint text
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),

                                      //create lable
                                      labelText: 'Contact No',
                                      //lable style
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14,
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
                    ],
                  );
                }
              ),
            ),

            ),
          ),

          Positioned(
              top: 100,
              left: 140,
              child:
              Image(image:
              AssetImage("assets/images/Profile1.png"),height: 100,width: 100,)

          ),
        ],
      ),
      ),
    );
  }
}
