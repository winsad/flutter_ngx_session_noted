import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/main.dart';

class BookListing extends StatefulWidget {
  const BookListing({super.key});

  @override
  State<BookListing> createState() => _BookListingState();
}

class _BookListingState extends State<BookListing> {
  List<Book> bookList = [
    Book(
      id: 1,
      title: "Clean Code",
      author: "Robert C. Martin",
      price: 34.99,
      rating: 4.4,
      imageUrl: "https://covers.openlibrary.org/b/id/12711613-L.jpg",
      description:
          "A handbook of agile software craftsmanship, essential for any developer.",
    ),
    Book(
      id: 2,
      title: "The Pragmatic Programmer",
      author: "Andrew Hunt",
      price: 39.95,
      rating: 4.8,
      imageUrl: "https://covers.openlibrary.org/b/id/10411116-L.jpg",
      description:
          "One of the most significant books in software development history.",
    ),
    Book(
      id: 3,
      title: "Atomic Habits",
      author: "James Clear",
      price: 16.20,
      rating: 4.8,
      imageUrl: "https://covers.openlibrary.org/b/id/12864311-L.jpg",
      description: "A proven way to build good habits and break bad ones.",
    ),
    Book(
      id: 4,
      title: "The Great Gatsby",
      author: "F. Scott Fitzgerald",
      price: 10.99,
      rating: 3.9,
      imageUrl: "https://covers.openlibrary.org/b/id/12651167-L.jpg",
      description: "A classic story of wealth, love, and the American Dream.",
    ),
    Book(
      id: 5,
      title: "1984",
      author: "George Orwell",
      price: 9.99,
      rating: 4.3,
      imageUrl: "https://covers.openlibrary.org/b/id/12713803-L.jpg",
      description:
          "A dystopian social science fiction novel and cautionary tale.",
    ),
    Book(
      id: 6,
      title: "The Alchemist",
      author: "Paulo Coelho",
      price: 11.50,
      rating: 4.7,
      imageUrl: "https://covers.openlibrary.org/b/id/12725845-L.jpg",
      description:
          "A journey of following your dreams and listening to your heart.",
    ),
    Book(
      id: 7,
      title: "Project Hail Mary",
      author: "Andy Weir",
      price: 18.99,
      rating: 4.7,
      imageUrl: "https://covers.openlibrary.org/b/id/10620248-L.jpg",
      description:
          "A lone astronaut must save the earth from an extinction-level threat.",
    ),
    Book(
      id: 8,
      title: "Deep Work",
      author: "Cal Newport",
      price: 14.99,
      rating: 4.2,
      imageUrl: "https://covers.openlibrary.org/b/id/12760710-L.jpg",
      description: "Rules for focused success in a distracted digital world.",
    ),
    Book(
      id: 9,
      title: "The Silent Patient",
      author: "Alex Michaelides",
      price: 12.00,
      rating: 4.2,
      imageUrl: "https://covers.openlibrary.org/b/id/12752174-L.jpg",
      description:
          "A woman's act of violence against her husband and her subsequent silence.",
    ),
    Book(
      id: 10,
      title: "Sapiens",
      author: "Yuval Noah Harari",
      price: 18.50,
      rating: 4.4,
      imageUrl: "https://covers.openlibrary.org/b/id/12781454-L.jpg",
      description:
          "A brief history of humankind from the Stone Age to the modern day.",
    ),
    Book(
      id: 11,
      title: "Dune",
      author: "Frank Herbert",
      price: 15.00,
      rating: 4.2,
      imageUrl: "https://covers.openlibrary.org/b/id/12833075-L.jpg",
      description:
          "The epic sci-fi saga of Paul Atreides on the desert planet Arrakis.",
    ),
    Book(
      id: 12,
      title: "Circe",
      author: "Madeline Miller",
      price: 13.99,
      rating: 4.3,
      imageUrl: "https://covers.openlibrary.org/b/id/12711018-L.jpg",
      description:
          "A bold reimagining of the myth of the sorceress daughter of Helios.",
    ),
    Book(
      id: 13,
      title: "The Hobbit",
      author: "J.R.R. Tolkien",
      price: 14.00,
      rating: 4.8,
      imageUrl: "https://covers.openlibrary.org/b/id/12720468-L.jpg",
      description: "The adventure of Bilbo Baggins and his quest for treasure.",
    ),
    Book(
      id: 14,
      title: "Educated",
      author: "Tara Westover",
      price: 15.50,
      rating: 4.5,
      imageUrl: "https://covers.openlibrary.org/b/id/12715007-L.jpg",
      description:
          "A memoir about a young woman who leaves her survivalist family for university.",
    ),
    Book(
      id: 15,
      title: "Steve Jobs",
      author: "Walter Isaacson",
      price: 21.00,
      rating: 4.2,
      imageUrl: "https://covers.openlibrary.org/b/id/12735741-L.jpg",
      description: "The exclusive biography of the Apple co-founder.",
    ),
    Book(
      id: 16,
      title: "The Subtle Art of Not Giving a F*ck",
      author: "Mark Manson",
      price: 13.00,
      rating: 4.0,
      imageUrl: "https://covers.openlibrary.org/b/id/12717983-L.jpg",
      description: "A counterintuitive approach to living a good life.",
    ),
    Book(
      id: 17,
      title: "Where the Crawdads Sing",
      author: "Delia Owens",
      price: 11.00,
      rating: 4.4,
      imageUrl: "https://covers.openlibrary.org/b/id/12711019-L.jpg",
      description: "A beautiful coming-of-age story and a murder mystery.",
    ),
    Book(
      id: 18,
      title: "Zero to One",
      author: "Peter Thiel",
      price: 17.00,
      rating: 4.2,
      imageUrl: "https://covers.openlibrary.org/b/id/12711611-L.jpg",
      description: "Notes on startups, or how to build the future.",
    ),
    Book(
      id: 19,
      title: "The 7 Habits of Highly Effective People",
      author: "Stephen Covey",
      price: 14.50,
      rating: 4.5,
      imageUrl: "https://covers.openlibrary.org/b/id/12711612-L.jpg",
      description:
          "A step-by-step pathway for living with fairness and integrity.",
    ),
    Book(
      id: 20,
      title: "Foundation",
      author: "Isaac Asimov",
      price: 12.99,
      rating: 4.1,
      imageUrl: "https://covers.openlibrary.org/b/id/12713805-L.jpg",
      description:
          "A mathematician predicts the fall of a galactic empire and tries to save knowledge.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Book Listing"), centerTitle: true),

      // body
      body: ListView.separated(
        padding: .all(20),
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          final Book book = bookList[index];

          return Container(
            color: Colors.blueGrey.shade100,
            child: ListTile(
              title: Text(book.title),
              subtitle: Text(book.description),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.bookDetails,
                  arguments: book,
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
      ),
    );
  }
}

class Book {
  final int id;
  final String title;
  final String author;
  final double price;
  final String description;
  final double rating;
  final String imageUrl;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
    required this.rating,
    required this.imageUrl,
  });
}
