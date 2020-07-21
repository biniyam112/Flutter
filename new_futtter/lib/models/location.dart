import 'locationfact.dart';

class Location {
  final int id;
  String name;
  String imagePath;
  final List<LocationFact> facts;

  Location(this.id, this.name, this.imagePath, this.facts);

  static List<Location> fetchAll() {
    return [
      Location(1,'Kiyomizu-dera','assets/images/79708-full_abstract-wallpaper-hd-artworks-cool-desktop-images-art.jpg',[
            // ...
            LocationFact('Africa',
                'We are talking about the country who is tearing up plus He assured that Egypt, though all its institutions, will find every available track to protect its interests and water rights.'),
            LocationFact('Love',
                'Filled with people who live in harmony with each other and the rest of the world. But especially with each other')
          ]),
      Location(2, 'Mount Fuji', 'assets/images/GERD-afp.jpg', [
        // ...
        LocationFact('Africa',
            'We are talking about the country who is tearing up plus He assured that Egypt, though all its institutions, will find every available track to protect its interests and water rights.'),
        LocationFact('Love',
            'Filled with people who live in harmony with each other and the rest of the world. But especially with each other')
      ]),
      Location(3,'Arashiyama Bamboo Grove','assets/images/wallpapersden.com_kakashi-hatake-naruto_4622x2600.jpg',[
            // ...
            LocationFact('Africa',
                'We are talking about the country who is tearing up plus He assured that Egypt, though all its institutions, will find every available track to protect its interests and water rights.'),
            LocationFact('Love',
                'Filled with people who live in harmony with each other and the rest of the world. But especially with each other')
          ]),
    ];
  }

  static Location fetchById(int locationId) {
    List<Location> locations = fetchAll();
    for (int i = 0; i < locations.length; i++) {
      if (locations[i].id == locationId) {
        return locations[i];
      }
    }
    return null;
  }
}
