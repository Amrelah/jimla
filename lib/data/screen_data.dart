import 'package:jimla/screens/cart.dart';
import 'package:jimla/screens/favorite.dart';
import 'package:jimla/screens/histry.dart';
import 'package:jimla/screens/home.dart';
import 'package:jimla/screens/profile.dart';

List screens = [
  {
    'name' : const Home(),
    'id' : 0,
  },
  {
    'name' : const Favorite(),
    'id' : 1,
  },
  {
    'name' : const Cart(),
    'id' : 2,
  },
  {
    'name' : const History(),
    'id' : 3,
  },
  {
    'name' : const Profile(),
    'id' : 4,
  },
];