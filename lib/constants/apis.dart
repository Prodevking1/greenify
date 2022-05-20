const serverAddress = "https://secured-taxi.herokuapp.com";

class Apis {
  static const String signUp = "$serverAddress/driver/create";
  static const String login = "$serverAddress/driver/login";
  static const String checkNumber = "$serverAddress/driver/onebynumber/";
  static const String uploadDoc = "$serverAddress/driver/send-image";
  static const String getAllRide = "$serverAddress/ride/user_driver/";
  static const String updateDriver = "$serverAddress/driver/update/";

  // static const String googleAPI =
  //     'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=address&language=en&components=country:ci&key=$key';

}
