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

  Book(
    id: 21,
    title: "The Hitchhiker's Guide to the Galaxy",
    author: "Douglas Adams",
    price: 14.99,
    rating: 4.5,
    imageUrl: "https://covers.openlibrary.org/b/id/12711615-L.jpg",
    description:
        "A hilarious galactic journey following Arthur Dent, the last surviving human.",
  ),
  Book(
    id: 22,
    title: "Ender's Game",
    author: "Orson Scott Card",
    price: 13.50,
    rating: 4.3,
    imageUrl: "https://covers.openlibrary.org/b/id/12735742-L.jpg",
    description:
        "Child genius Ender Wiggin is trained in a brutal space military school.",
  ),
  Book(
    id: 23,
    title: "Fahrenheit 451",
    author: "Ray Bradbury",
    price: 12.00,
    rating: 4.0,
    imageUrl: "https://covers.openlibrary.org/b/id/12713807-L.jpg",
    description:
        "In a future where books are banned, a fireman begins to question his job.",
  ),
  Book(
    id: 24,
    title: "The Name of the Wind",
    author: "Patrick Rothfuss",
    price: 19.95,
    rating: 4.5,
    imageUrl: "https://covers.openlibrary.org/b/id/12711020-L.jpg",
    description:
        "A legendary figure tells the true story of his rise to power and infamy.",
  ),
  Book(
    id: 25,
    title: "American Gods",
    author: "Neil Gaiman",
    price: 16.99,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12711021-L.jpg",
    description:
        "A war is brewing between the Old Gods of mythology and the New Gods of technology.",
  ),
  Book(
    id: 26,
    title: "I, Robot",
    author: "Isaac Asimov",
    price: 11.99,
    rating: 4.2,
    imageUrl: "https://covers.openlibrary.org/b/id/12735743-L.jpg",
    description:
        "A collection of stories that defined the Three Laws of Robotics.",
  ),
  Book(
    id: 27,
    title: "The Martian",
    author: "Andy Weir",
    price: 15.00,
    rating: 4.4,
    imageUrl: "https://covers.openlibrary.org/b/id/12711617-L.jpg",
    description:
        "An astronaut is stranded on Mars and must use science to survive.",
  ),

  // --- CLASSICS ---
  Book(
    id: 28,
    title: "Pride and Prejudice",
    author: "Jane Austen",
    price: 9.99,
    rating: 4.3,
    imageUrl: "https://covers.openlibrary.org/b/id/12651169-L.jpg",
    description:
        "A classic romance exploring manners, upbringing, and marriage.",
  ),
  Book(
    id: 29,
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    price: 13.99,
    rating: 4.5,
    imageUrl: "https://covers.openlibrary.org/b/id/12711618-L.jpg",
    description: "A powerful story of racial injustice in the American South.",
  ),
  Book(
    id: 30,
    title: "Frankenstein",
    author: "Mary Shelley",
    price: 8.50,
    rating: 3.8,
    imageUrl: "https://covers.openlibrary.org/b/id/12711022-L.jpg",
    description:
        "Victor Frankenstein creates a sentient being with tragic consequences.",
  ),
  Book(
    id: 31,
    title: "Moby Dick",
    author: "Herman Melville",
    price: 11.00,
    rating: 3.5,
    imageUrl: "https://covers.openlibrary.org/b/id/12735744-L.jpg",
    description:
        "Captain Ahab's obsessive quest to kill the great white whale.",
  ),
  Book(
    id: 32,
    title: "Jane Eyre",
    author: "Charlotte Brontë",
    price: 10.50,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12711619-L.jpg",
    description: "The story of an orphan girl who grows up to be a governess.",
  ),
  Book(
    id: 33,
    title: "The Picture of Dorian Gray",
    author: "Oscar Wilde",
    price: 9.95,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12711023-L.jpg",
    description:
        "A man remains young while his portrait ages and shows his sins.",
  ),
  Book(
    id: 34,
    title: "Wuthering Heights",
    author: "Emily Brontë",
    price: 8.99,
    rating: 3.9,
    imageUrl: "https://covers.openlibrary.org/b/id/12735745-L.jpg",
    description: "A dark tale of love and revenge on the Yorkshire moors.",
  ),

  // --- MODERN FICTION & THRILLERS ---
  Book(
    id: 35,
    title: "The Hunger Games",
    author: "Suzanne Collins",
    price: 12.99,
    rating: 4.3,
    imageUrl: "https://covers.openlibrary.org/b/id/12711024-L.jpg",
    description:
        "Katniss Everdeen volunteers for a fight to the death on live TV.",
  ),
  Book(
    id: 36,
    title: "The Da Vinci Code",
    author: "Dan Brown",
    price: 14.50,
    rating: 3.9,
    imageUrl: "https://covers.openlibrary.org/b/id/12711620-L.jpg",
    description: "A murder in the Louvre leads to a religious conspiracy.",
  ),
  Book(
    id: 37,
    title: "Gone Girl",
    author: "Gillian Flynn",
    price: 13.00,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12735746-L.jpg",
    description: "A twisted thriller about a marriage gone horribly wrong.",
  ),
  Book(
    id: 38,
    title: "The Book Thief",
    author: "Markus Zusak",
    price: 12.99,
    rating: 4.4,
    imageUrl: "https://covers.openlibrary.org/b/id/12711025-L.jpg",
    description: "Death narrates the story of a girl in Nazi Germany.",
  ),
  Book(
    id: 39,
    title: "Where the Crawdads Sing",
    author: "Delia Owens",
    price: 15.99,
    rating: 4.4,
    imageUrl: "https://covers.openlibrary.org/b/id/12711621-L.jpg",
    description:
        "A young girl grows up alone in the marshes of North Carolina.",
  ),
  Book(
    id: 40,
    title: "Shuggie Bain",
    author: "Douglas Stuart",
    price: 17.00,
    rating: 4.3,
    imageUrl: "https://covers.openlibrary.org/b/id/12735747-L.jpg",
    description:
        "A heart-wrenching portrait of working-class Glasgow in the 80s.",
  ),

  // --- NON-FICTION & SELF-GROWTH ---
  Book(
    id: 41,
    title: "Thinking, Fast and Slow",
    author: "Daniel Kahneman",
    price: 18.99,
    rating: 4.2,
    imageUrl: "https://covers.openlibrary.org/b/id/12711026-L.jpg",
    description:
        "A deep dive into the two systems that drive the way we think.",
  ),
  Book(
    id: 42,
    title: "Quiet",
    author: "Susan Cain",
    price: 16.00,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12711622-L.jpg",
    description: "The power of introverts in a world that can't stop talking.",
  ),
  Book(
    id: 43,
    title: "The Power of Habit",
    author: "Charles Duhigg",
    price: 15.50,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12735748-L.jpg",
    description: "Explores why we do what we do in life and business.",
  ),
  Book(
    id: 44,
    title: "The Immortal Life of Henrietta Lacks",
    author: "Rebecca Skloot",
    price: 14.99,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12711027-L.jpg",
    description: "The story of the woman whose cells changed medical history.",
  ),
  Book(
    id: 45,
    title: "Born a Crime",
    author: "Trevor Noah",
    price: 18.00,
    rating: 4.5,
    imageUrl: "https://covers.openlibrary.org/b/id/12711623-L.jpg",
    description: "Stories from a South African childhood during Apartheid.",
  ),
  Book(
    id: 46,
    title: "Educated",
    author: "Tara Westover",
    price: 16.99,
    rating: 4.5,
    imageUrl: "https://covers.openlibrary.org/b/id/12735749-L.jpg",
    description:
        "A memoir about leaving a survivalist family for an education.",
  ),

  // --- HISTORICAL & LITERARY ---
  Book(
    id: 47,
    title: "One Hundred Years of Solitude",
    author: "Gabriel García Márquez",
    price: 15.99,
    rating: 4.1,
    imageUrl: "https://covers.openlibrary.org/b/id/12711028-L.jpg",
    description:
        "The multi-generational story of the Buendía family in Macondo.",
  ),
  Book(
    id: 48,
    title: "The Great Alone",
    author: "Kristin Hannah",
    price: 17.50,
    rating: 4.3,
    imageUrl: "https://covers.openlibrary.org/b/id/12711624-L.jpg",
    description: "A family moves to the Alaskan wild for a fresh start.",
  ),
  Book(
    id: 49,
    title: "Crying in H Mart",
    author: "Michelle Zauner",
    price: 16.00,
    rating: 4.4,
    imageUrl: "https://covers.openlibrary.org/b/id/12735750-L.jpg",
    description: "An unforgettable memoir about family, food, and grief.",
  ),
  Book(
    id: 50,
    title: "The Nightingale",
    author: "Kristin Hannah",
    price: 14.99,
    rating: 4.6,
    imageUrl: "https://covers.openlibrary.org/b/id/12711029-L.jpg",
    description: "Two sisters in France during WWII struggle to survive.",
  ),
];
