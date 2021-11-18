import 'package:get/get.dart';

class AuthInfo extends GetxController {
  var password = "".obs;
  var phone = "".obs;

  void setPassword(password) {
    this.password.value = password;
  }

  void setPhone(phone) {
    this.phone.value = phone;
  }
}
