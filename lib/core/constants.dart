abstract class Constants {
  static RegExp phoneRegex = RegExp(r'^(?:\+20|0)?1[0-9]{9}$');
  static RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$");
  static RegExp passwordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{8,}$');
  static const String baseUrl = "http://192.168.1.10:3000/";
}
