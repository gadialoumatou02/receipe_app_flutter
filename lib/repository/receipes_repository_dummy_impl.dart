import 'package:recipe_app/data/receipe.dart';
import 'package:recipe_app/repository/receipe_repository.dart';

class ReceipeRepositoryDummyImpl implements ReceipeRepository {

  @override
  late List<Receipe> receipes = [
    Receipe("Simple Cake",10, 30, 12,
        [("sugar",200),("butter",125),
          ("eggs",2),("flour",200),("backing powder",10),("milk",12.5)],
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus."
            "Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. "
            "Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. "
            "Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat.",
        "assets/images/simple-white-cake.png"
    ),
    Receipe("Chocolate Cake",15, 25, 8,
        [("chocolate",200),("sugar",200),("butter",125),
          ("eggs",2),("backing powder",()),("milk",12.5)],
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus."
            "Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. "
            "Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. "
            "Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat.",
        "assets/images/chocolate-cake.jpg"
    ),
    Receipe("Clafoutis",15, 25, 8,
        [("pear",6),("sugar",180),("butter",10),
          ("eggs",6),("liquid cream",50),("milk",12.5)],
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus."
            "Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. "
            "Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. "
            "Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat.",
        "assets/images/clafoutis.jpg"
    ),

  ];
}