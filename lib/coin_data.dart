import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'B41DFA8C-29D1-4A0F-B531-F40547CC33F2';
const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData(this.currency);
  // String? coin;
  String? currency;
  double BTC = 0;
  double ETH = 0;
  double LTC = 0;
  Future<void> getData() async {
    for (String coin in cryptoList) {
      http.Response response = await http.get(Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$coin/$currency?apikey=$apiKey'));
      if (response.statusCode == 200) {
        String data = response.body;
        var apidata = jsonDecode(data);
        if (coin == 'BTC') {
          BTC = apidata['rate'];
        } else if (coin == 'ETH') {
          ETH = apidata['rate'];
        } else {
          LTC = apidata['rate'];
        }
      } else {
        print(response.statusCode);
      }
    }

    // if (response.statusCode == 200) {
    //   String data = response.body;
    //   var apidata = jsonDecode(data);
    //   var rate = apidata['rate'];
    //   return rate = rate.toStringAsFixed(2);
    //   // return rate;
    // } else {
    //   print(response.statusCode);
    // }
  }
}
