import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/login_controller.dart';
import '../../../routes/app_pages.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181a20),
      /* appBar: AppBar(
   
      ), */
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Container(
                //color: Colors.amber,
                width: 500.0,
                height: 100.0,
                child: const Text(
                  "Login to your\nAccount",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 39,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              TextFormField(
                  showCursor: false,
                  style: const TextStyle(color: Colors.white),
                  controller: controller.emailcontroller,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff1ab65c)),
                      ),
                      //beyaz renkli border
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ))),
              const SizedBox(
                height: 25,
              ),
              TextFormField(
                  showCursor: false,
                  style: const TextStyle(color: Colors.white),
                  controller: controller.passwordcontroller,
                  decoration: const InputDecoration(
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                      prefixIcon: Icon(
                        Icons.key,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Color(0xff1ab65c)),
                      ),
                      //beyaz renkli border
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.white),
                      ))),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              width: 3, color: const Color(0xff1ab65c))),
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  /*  controller.service.account(controller.emailcontroller.text,
                      controller.passwordcontroller.text); */
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xff1ab65c),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              const Text(
                "Forgot the password?",
                style: TextStyle(
                    color: Color(0xff1ab65c),
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Row(children: const [
                  Expanded(
                      child: Divider(
                    endIndent: 10,
                    indent: 10,
                    color: Colors.white,
                  )),
                  Text(
                    "or continue with",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.white,
                  )),
                ]),
              ),
              Container(
                width: 300,
                height: 60,
                //color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    socialContainer(
                        Icons.facebook, Color.fromARGB(255, 37, 103, 158)),
                    socialContainer(Icons.face, Colors.red),
                    socialContainer(Icons.apple, Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                          //Get.to(RegisterView(), binding: RegisterBinding());
                        },
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Color(0xff1ab65c),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

socialContainer(IconData icon, Color colors) {
  return Container(
    alignment: Alignment.center,
    width: 70,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 2, color: Colors.white24)),
    child: Icon(
      icon,
      color: colors,
    ),
  );
}
