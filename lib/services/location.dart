import 'package:geolocator/geolocator.dart';


class Location{
  double ? longitude;
  double ? latitude;

  Future<void> getCurrentlocation() async{
    Position position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    latitude=position.latitude;
    longitude=position.longitude;
    print(position);
  }


}