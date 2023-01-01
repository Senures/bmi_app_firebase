import 'package:bmi_firebase_app/app/controllers/user_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class UserInfoPage extends GetView<UserInfoController> {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bilgileriniz"),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .2,
                          width: double.infinity,
                          child: Obx(() {
                            return Row(
                              children: [
                                buildGenderBox(
                                  onTap: () => controller.setGender(
                                      gender: GenderEnum.male),
                                  genderType: GenderEnum.male,
                                  icon: Icons.male,
                                ),
                                buildGenderBox(
                                  onTap: () => controller.setGender(
                                      gender: GenderEnum.female),
                                  genderType: GenderEnum.female,
                                  icon: Icons.female,
                                ),
                              ],
                            );
                          }),
                        ),
                        const SizedBox(height: 10),
                        buildTextFild(
                          context: context,
                          tfTitle: "cm",
                          controller: controller.heightCtrl,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        buildTextFild(
                          context: context,
                          tfTitle: "kg",
                          controller: controller.kiloCtrl,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        buildTextFild(
                          context: context,
                          tfTitle: "goal",
                          controller: controller.goalCtrl,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        buildTextFild(
                          context: context,
                          tfTitle: "age",
                          controller: controller.ageCtrl,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 10),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                          height: 50,
                          minWidth: MediaQuery.of(context).size.width,
                          color: const Color(0xff61ACFA),
                          onPressed: () {
                            controller.saveData();
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }

  Widget buildGenderBox(
      {required VoidCallback onTap,
      required GenderEnum genderType,
      required IconData icon}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: InkWell(
          onTap: onTap,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: controller.genderEnum!.value == genderType
                  ? const Color(0xff72909D)
                  : const Color(0xff34434E),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Colors.white,
                ),
                Text(
                  genderType.name,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFild(
      {required BuildContext context,
      required String tfTitle,
      required TextEditingController controller,
      required String? Function(String?)? validator}) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              tfTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * .3,
              height: MediaQuery.of(context).size.height * .075,
              decoration: BoxDecoration(
                color: const Color(0xff2F3F4B),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: TextFormField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: validator,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
