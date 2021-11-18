import 'package:get/get.dart';

class AuthInfo extends GetxController {
  var password = "".obs;
  var phone = "".obs;
  var is_doctor = false.obs;
  var chatTime = 0.obs;
  var name = "".obs;

  String getName() {
    return name.value;
  }

  void setName(name) {
    this.name.value = name;
  }

  void setChatTime(chatTime) {
    this.chatTime.value = chatTime;
  }

  int getChatTime() {
    return chatTime.value;
  }

  void setPassword(password) {
    this.password.value = password;
  }

  void setPhone(phone) {
    this.phone.value = phone;
  }

  void setDoctor(is_doctor) {
    this.is_doctor.value = is_doctor;
  }

  bool getDoctor() {
    return this.is_doctor.value;
  }

  String getPhone() {
    return this.phone.value;
  }

  String getPassword() {
    return this.password.value;
  }
}
