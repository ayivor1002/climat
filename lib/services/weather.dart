import 'networking.dart';
import 'location.dart';

const apikey="d85fbb9bfe176e06c2ef07275888ba24";
const openWheatherUrl="https://api.openweathermap.org/data/2.5/weather";




class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url="$openWheatherUrl?q=$cityName&appid=$apikey";
    NetworkHelper networkHelper=NetworkHelper(url: url);
    var weatherData=await networkHelper.getData();
    return weatherData;

  }

  Future<dynamic> getLocationWeather(String cityName) async {
    Location location=Location();
    await location.getCurrentlocation();
    String url="$openWheatherUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey";
    NetworkHelper networkHelper=NetworkHelper(url: url);
    var weatherData=await networkHelper.getData();
    return weatherData;

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
