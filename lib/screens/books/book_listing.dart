import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/routes/routes.dart';
import 'package:flutter_event_navigation/screens/books/book_model.dart';

enum GridType { one, two }

class BookListing extends StatefulWidget {
  const BookListing({super.key});

  @override
  State<BookListing> createState() => _BookListingState();
}

class _BookListingState extends State<BookListing> {
  late List<Book> books = List.from(bookList);
  GridType selected = GridType.one;
  bool showSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Listing"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {
                showSearch = !showSearch;
              });
            },
            child: Icon(CupertinoIcons.search),
          ),

          SizedBox(width: 10),

          //
          GestureDetector(
            onTap: () {
              // if (selected == GridType.one) {
              //   selected = GridType.two;
              // } else {
              //   selected = GridType.one;
              // }
              selected = selected == GridType.one ? GridType.two : GridType.one;
              setState(() {});
            },
            child: Icon(
              selected == GridType.one
                  ? CupertinoIcons.rectangle_grid_1x2
                  : CupertinoIcons.rectangle_grid_2x2,
            ),
          ),

          //
          SizedBox(width: 10),
        ],
      ),

      // body
      body: Column(
        spacing: 10,
        children: [
          // searh form view
          if (showSearch)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    CupertinoIcons.search,
                    size: 22,
                    color: Colors.grey,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                ),
                onChanged: (value) {
                  // do the filter
                  _onChangedFilter(value);
                },
              ),
            ),

          // item views
          Expanded(
            child: GridView.builder(
              padding: .all(16),
              itemCount: books.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: selected == GridType.one ? 1 : 2,
                mainAxisExtent: selected == GridType.one ? 100 : 200,
              ),
              itemBuilder: (context, index) {
                final Book book = books[index];
                return selected == GridType.one
                    ? _buildSingleCard(book)
                    : _buildDoubleCard(book);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleCard(Book book) {
    return Card(
      child: ListTile(
        leading: ClipOval(
          child: SizedBox(
            width: 56,
            child: Hero(
              tag: 'hero_book_image_${book.id}',
              child: Image.network(
                book.imageUrl,
                height: 56,
                width: 56,
                fit: .cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: 30,
                    width: 30,
                    child: Center(child: Text('Error')),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return SizedBox(
                      height: 30,
                      width: 30,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeCap: StrokeCap.round,
                        ),
                      ),
                    );
                  }

                  return child;
                },
              ),
            ),
          ),
        ),
        title: Text(book.title),
        subtitle: Text('${book.author} \$${book.price}', maxLines: 1),
        onTap: () {
          Navigator.pushNamed(context, RouteName.bookDetails, arguments: book);
        },
        trailing: Row(
          spacing: 5,
          mainAxisSize: .min,
          children: [
            Icon(CupertinoIcons.star_fill, size: 18, color: Colors.amber),
            Text(book.rating.toString()),
          ],
        ),
      ),
    );
  }

  Widget _buildDoubleCard(Book book) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteName.bookDetails, arguments: book);
        },
        child: Padding(
          padding: .all(10),
          child: Column(
            spacing: 5,
            crossAxisAlignment: .start,
            children: [
              // image
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Hero(
                    tag: 'hero_book_image_${book.id}',
                    child: Image.network(
                      book.imageUrl,
                      height: 80,
                      width: double.infinity,
                      fit: .cover,
                      errorBuilder: (context, error, stackTrace) {
                        return SizedBox(
                          height: 30,
                          width: 30,
                          child: Center(child: Text('Error')),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress != null) {
                          return SizedBox(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: CircularProgressIndicator(
                                strokeCap: StrokeCap.round,
                              ),
                            ),
                          );
                        }

                        return child;
                      },
                    ),
                  ),
                ),
              ),

              Row(
                crossAxisAlignment: .start,
                children: [
                  // title
                  Expanded(
                    child: Text(
                      book.title,
                      style: TextStyle(fontWeight: .w500),
                    ),
                  ),
                  // rating
                  Row(
                    spacing: 5,
                    mainAxisSize: .min,
                    children: [
                      Icon(
                        CupertinoIcons.star_fill,
                        size: 18,
                        color: Colors.amber,
                      ),
                      Text(book.rating.toString()),
                    ],
                  ),
                ],
              ),

              // author
              Text(
                '${book.author} \$${book.price}',
                maxLines: 1,
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // on changed filter
  void _onChangedFilter(String filterText) {
    final List<Book> newList = List.from(bookList);

    if (filterText.isEmpty) {
      books = newList;
    }

    final filterList = newList
        .where(
          (e) =>
              e.title.toLowerCase().contains(filterText.toLowerCase()) ||
              e.description.toLowerCase().contains(filterText.toLowerCase()) ||
              e.author.toLowerCase().contains(filterText.toLowerCase()) ||
              e.price.toString().toLowerCase().contains(
                filterText.toLowerCase(),
              ),
        )
        .toList();

    books = filterList;
    setState(() {});
  }
}
