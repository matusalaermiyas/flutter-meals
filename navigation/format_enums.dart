import './models/meal.dart';

String complexityType(Complexity complexity) {
  switch (complexity) {
    case Complexity.simple:
      return 'Simple';
    case Complexity.challenging:
      return 'Challenging';
    case Complexity.hard:
      return 'Hard';
    default:
      return 'Unknown';
  }
}

String affordabilityType(Affordability affordability) {
  switch (affordability) {
    case Affordability.affordable:
      return 'Affordable';
    case Affordability.luxurious:
      return 'Luxurious';
    case Affordability.pricey:
      return 'Pricey';
    default:
      return 'Unknown';
  }
}
