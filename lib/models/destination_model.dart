List<String> categories = ["Popular", "Nearby", "Hotel", "Mountain"];

class Member {
  final String image;

  Member({required this.image});
}

List<String> members = [
  'images/members/member1.jpg',
  'images/members/member2.jpg',
  'images/members/member3.jpg',
  'images/members/member4.jpg',
  'images/members/member5.jpg',
  'images/members/member6.jpg',
];

class Destination {
  final int? id, price;
  final String? name, description, image, category, location;
  final double? rate;
  final List<String>? members;
  // final List<Facilities>? facilities;

  Destination({
    this.id,
    this.price = 111,
    this.name,
    this.description,
    this.image,
    this.category,
    this.location,
    this.rate,
    this.members,
    // this.facilities
  });
}

List<Destination> destinations = [
  Destination(
    id: 1,
    name: "Md Omar Faruque Fahad",
    price: 320,
    category: "Popular",
    members: [
      members[0],
      members[1],
      members[2],
      members[3],
      members[4],
      members[5],
    ],
    image:
        "https://images.unsplash.com/photo-1678009859747-9f4620e0c355?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D",
    description:
        "Choose from a curated selection of tourism photos. Always free on Unsplash.",
    location: "Luton,London",
    rate: 4.6,
    // facilities: []
  ),
  Destination(
    id: 2,
    name: "Md Omar Faruque Fahad",
    price: 320,
    category: "Nearby",
    members: [
      members[0],
      members[1],
      members[2],
      members[3],
      members[4],
      members[5],
    ],
    image:
        "https://images.unsplash.com/photo-1532878056386-1e96eb5221ad?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTJ8fHxlbnwwfHx8fHw%3D",
    description:
        "Choose from a curated selection of tourism photos. Always free on Unsplash.",
    location: "Luton,London",
    rate: 4.6,
    // facilities: []
  ),
  Destination(
    id: 3,
    name: "Md Omar Faruque Fahad",
    price: 320,
    category: "Hotel",
    members: [
      members[0],
      members[1],
      members[2],
      members[3],
      members[4],
      members[5],
    ],
    image:
        "https://images.unsplash.com/photo-1505925549702-82c93eea28a0?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTV8fHxlbnwwfHx8fHw%3D",
    description:
        "Choose from a curated selection of tourism photos. Always free on Unsplash.",
    location: "Luton,London",
    rate: 4.6,
    // facilities: []
  ),
  Destination(
    id: 4,
    name: "Md Omar Faruque Fahad",
    price: 320,
    category: "Mountain",
    members: [
      members[0],
      members[1],
      members[2],
      members[3],
      members[4],
      members[5],
    ],
    image:
        "https://images.unsplash.com/photo-1524467128837-00f6644866d7?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTl8fHxlbnwwfHx8fHw%3D",
    description:
        "Choose from a curated selection of tourism photos. Always free on Unsplash.",
    location: "Luton,London",
    rate: 4.6,
    // facilities: []
  ),
  // Destination(
  //   id: 5,
  //   name: "Md Omar Faruque Fahad",
  //   price: 320,
  //   category: "Nearby",
  //   members: [
  //     members[0],
  //     members[1],
  //     members[2],
  //     members[3],
  //     members[4],
  //     members[5],
  //   ],
  //   image:
  //       "https://media.istockphoto.com/id/1358569473/photo/hiking-group-in-valley-of-umbalfaelle-on-grossvenediger-with-view-to-mountain-roetspitze-in.webp?a=1&b=1&s=612x612&w=0&k=20&c=Gf9q3yzu2hgtFWDmlCwFBmPKb978gnWT-SfIBSupr_o=",
  //   description:
  //       "Choose from a curated selection of tourism photos. Always free on Unsplash.",
  //   location: "Luton,London",
  //   rate: 4.6,
  //   // facilities: []
  // ),
];
