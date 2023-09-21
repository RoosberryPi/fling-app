// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? id;
  final String name;
  final String bio;
  final int age;
  final String gender;
  final List<dynamic> interests;
  final List<dynamic> imageUrls;
  final String jobTitle;
  final String location;

  const User({
    required this.id,
    required this.name,
    required this.bio,
    required this.age,
    required this.gender,
    required this.interests,
    required this.imageUrls,
    required this.jobTitle,
    required this.location,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        age,
        imageUrls,
        bio,
        jobTitle,
      ];

  // convert the data we get back from Firestore to a User object
  static User fromSnapshot(DocumentSnapshot snap) {
    User user = User(
      id: snap.id,
      name: snap['name'],
      age: snap['age'],
      gender: snap['gender'],
      imageUrls: snap['imageUrls'],
      interests: snap['interests'],
      bio: snap['bio'],
      jobTitle: snap['jobTitle'],
      location: snap['location'],
    );
    return user;
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'gender': gender,
      'imageUrls': imageUrls,
      'interests': interests,
      'bio': bio,
      'jobTitle': jobTitle,
      'location': location,
    };
  }

  static List<User> users = [
    const User(
      id: '1',
      name: 'John',
      age: 25,
      gender: 'Male',
      imageUrls: [
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
        'https://images.unsplash.com/photo-1691162534642-eb3779a8c231?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80',
        'https://images.unsplash.com/photo-1690390294159-76d4aa68e53d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
        'https://images.unsplash.com/photo-1595623238469-fc58b3839cf6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=755&q=80',
      ],
      jobTitle: 'Software engineer',
      interests: ['Music', 'DJ-ing', 'Football'],
      bio: 'Is looking for a serious relationship',
      location: 'Amsterdam',
    ),
    const User(
      id: '2',
      name: 'Tamara',
      age: 30,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
      ],
      jobTitle: 'Job Title Here',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Happy and optimistic',
      location: 'Zaandam',
    ),
    const User(
      id: '3',
      name: 'Marta',
      age: 35,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ],
      jobTitle: 'Coach',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Is looking for a nice partner who is also into football',
      location: 'Utrecht',
    ),
    const User(
      id: '4',
      name: 'Sara',
      age: 30,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
        'https://images.unsplash.com/photo-1622023459113-9b195477d9c4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=671&q=80',
      ],
      jobTitle: 'Actrice',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Likes to go out in the weekends',
      location: 'Utrecht',
    ),
    const User(
      id: '5',
      name: 'Anna',
      age: 35,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ],
      jobTitle: 'Administratief medewerker',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Hi, my name is Anna and I like travelling',
      location: 'Amsterdam',
    ),
    const User(
      id: '6',
      name: 'Lisa',
      age: 35,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1503185912284-5271ff81b9a8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ],
      jobTitle: 'Psycholoog',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Likes the outdoors, especially hiking and snowboarding',
      location: 'Amsterdam',
    ),
    const User(
      id: '7',
      name: 'Luisa',
      age: 35,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ],
      jobTitle: 'Dietist',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Free spirit',
      location: 'Almere',
    ),
    const User(
      id: '8',
      name: 'Sara',
      age: 35,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1589571894960-20bbe2828d0a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
        'https://images.unsplash.com/photo-1589571894960-20bbe2828d0a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
        'https://images.unsplash.com/photo-1589571894960-20bbe2828d0a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
        'https://images.unsplash.com/photo-1589571894960-20bbe2828d0a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
        'https://images.unsplash.com/photo-1589571894960-20bbe2828d0a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80',
      ],
      jobTitle: 'Dj',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Looking for something casual',
      location: 'Zaandam',
    ),
    const User(
      id: '9',
      name: 'Andrea',
      age: 35,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1622244099803-75318348305a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ],
      jobTitle: 'Verpleegkundige',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'I like board games',
      location: 'Amsterdam',
    ),
    const User(
      id: '10',
      name: 'Mary',
      age: 33,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1456885284447-7dd4bb8720bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1456885284447-7dd4bb8720bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1456885284447-7dd4bb8720bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1456885284447-7dd4bb8720bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
        'https://images.unsplash.com/photo-1456885284447-7dd4bb8720bf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
      ],
      jobTitle: 'Arts',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Red wine and sushi',
      location: 'Utrecht',
    ),
    const User(
      id: '11',
      name: 'Denise',
      age: 32,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1596815064285-45ed8a9c0463?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=615&q=80',
        'https://images.unsplash.com/photo-1596815064285-45ed8a9c0463?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=615&q=80',
        'https://images.unsplash.com/photo-1596815064285-45ed8a9c0463?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=615&q=80',
        'https://images.unsplash.com/photo-1596815064285-45ed8a9c0463?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=615&q=80',
        'https://images.unsplash.com/photo-1596815064285-45ed8a9c0463?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=615&q=80',
      ],
      jobTitle: 'Wijkhulp',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Cava and board games',
      location: 'Amsterdam',
    ),
    const User(
      id: '12',
      name: 'Elle',
      age: 36,
      gender: 'Female',
      imageUrls: [
        'https://images.unsplash.com/photo-1562003389-902303a38425?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1429&q=80',
        'https://images.unsplash.com/photo-1562003389-902303a38425?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1429&q=80'
            'https://images.unsplash.com/photo-1562003389-902303a38425?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1429&q=80'
            'https://images.unsplash.com/photo-1562003389-902303a38425?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1429&q=80'
            'https://images.unsplash.com/photo-1562003389-902303a38425?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1429&q=80'
      ],
      jobTitle: 'Componist',
      interests: ['Music', 'Economics', 'Football'],
      bio: 'Is looking for a muse. Plays piano.',
      location: 'Amsterdam',
    ),
  ];
}
