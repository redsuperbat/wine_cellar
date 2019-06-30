import 'package:flutter/material.dart';

const kActiveCardColor = Color.fromRGBO(29, 31, 50, 1);
const kInactiveCardColor = Color.fromRGBO(20, 19, 42, 1);
const kBackgroundColor = Color.fromRGBO(10, 13, 33, 1);
const kLabelColor = Color.fromRGBO(130, 128, 145, 1);
const kAccentColor = Color.fromRGBO(215, 53, 88, 1);
const kAccentShadeColor = Color.fromRGBO(215, 53, 88, 0.16);
const kAccentTextColor = Color.fromRGBO(109, 224, 134, 1);

const kBottomContainerHeight = 80.0;

const kLabelTextStyle = TextStyle(
  fontSize: 18,
  color: kLabelColor,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const kLargeLabelTextStyle = TextStyle(
  fontSize: 18,
);

const kMainTitleTextStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.bold,
);

const kAccentTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kAccentTextColor,
);

const kResultTextStyle = TextStyle(
  fontSize: 95,
  fontWeight: FontWeight.bold,
);

const kSecondaryLabelTextStyle = TextStyle(
  fontSize: 18,
  color: Colors.grey,
);

const List<String> wineSizes = ["375mL", "750mL", "1.5L", "3L", "6L"];

const List<String> countryNames = [
  "Spain",
  "France",
  "Argentina",
  "Austria",
  "Australia",
  "Chile",
  "Germany",
  "Italy",
  "Portugal",
  "America",
  "South Africa",
];

const List<String> wineCategories = [
  'Red',
  'White',
  'Rose',
  'Champagne',
  'Sparkling',
  'Sweet'
];

const List<String> csvTitle = [
  "Name and Wine Producer",
  "Type of wine",
  "Appelation of origin",
  "Cuntry of origin",
  "Vintage",
  "Grapes",
  "Number of bottles owned",
  "Size of bottles",
  "Path to image",
  "DateTime of aquiring",
  "Comments about the wine",
  "Bought-price",
  "Rating"
];

const List<String> currencies = [
  "EUR",
  "BGN",
  "GDP",
  "HRK",
  "CZK",
  "DKK",
  "HUF",
  "PLN",
  "RON",
  "SEK",
  "CHF"
];
