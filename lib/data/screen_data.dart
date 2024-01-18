import 'package:jimla/screens/cart.dart';
import 'package:jimla/screens/favorite.dart';
import 'package:jimla/screens/histry.dart';
import 'package:jimla/screens/home_page.dart';
import 'package:jimla/screens/profile.dart';

List screens = [
  {
    'name' : const HomePage(),
    'title' : 'ጅምላ|Jimla',
  },
  {
    'name' : const Favorite(),
    'title' : 'Favorite',
  },
  {
    'name' : const Cart(),
    'title' : 'My Cart',
  },
  {
    'name' : const History(),
    'title' : 'Order History',
  },
  {
    'name' : const Profile(),
    'title' : 'Profile',
  },
];