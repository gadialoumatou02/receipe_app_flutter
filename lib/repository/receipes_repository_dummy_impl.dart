import 'package:recipe_app/data/receipe.dart';
import 'package:recipe_app/repository/receipe_repository.dart';

class ReceipeRepositoryDummyImpl implements ReceipeRepository {

  @override
  late List<Receipe> receipes = [
    Receipe("Simple Cake",10, 30, 12,
        [
          {'name': 'sugar', 'qty': 200},
          {'name': 'butter', 'qty': 125},
          {'name': 'eggs', 'qty': 2},
          {'name': 'flour', 'qty': 200},
          {'name': 'backing powder', 'qty': 10},
          {'name': 'milk', 'qty': 12.5},
        ],
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.
        Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.
        Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi.
        Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat.
        ''',
        "assets/images/simple-white-cake.png"
    ),
    Receipe("Chocolate Cake",15, 25, 8,
        [
          {'name': 'chocolate', 'qty': 200},
          {'name': 'sugar', 'qty': 200},
          {'name': 'butter', 'qty': 125},
          {'name': 'eggs', 'qty': 2},
          {'name': 'backing powder', 'qty': 0},
          {'name': 'milk', 'qty': 12.5},
        ],
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.
        Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.
        Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi.
        Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat.
        ''',
        "assets/images/chocolate-cake.jpg"
    ),
    Receipe("Clafoutis",15, 25, 8,
        [
          {'name': 'pear', 'qty': 6},
          {'name': 'sugar', 'qty': 180},
          {'name': 'butter', 'qty': 10},
          {'name': 'eggs', 'qty': 6},
          {'name': 'liquid cream', 'qty': 50},
          {'name': 'milk', 'qty': 12.5},
        ],
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus.
        Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.
        Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi.
        Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat.
        ''',
        "assets/images/clafoutis.jpg"
    ),

  ];
}