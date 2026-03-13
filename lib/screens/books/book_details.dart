import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_event_navigation/screens/books/book_model.dart';

class BookDetails extends StatefulWidget {
  const BookDetails({super.key, required this.book});

  final Book book;

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // header
      appBar: AppBar(
        title: Text('Book Details'),
        centerTitle: true,
        elevation: 1,
      ),

      // body
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header Image
              Container(
                padding: .symmetric(horizontal: 40),
                // height: 250,
                alignment: Alignment.center,
                child: Hero(
                  tag: 'hero_book_image_${widget.book.id}',
                  child: Image.network(
                    widget.book.imageUrl,

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

              SizedBox(height: 16),

              // title
              Text(
                widget.book.title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),

              // author
              Text(widget.book.author, style: TextStyle(color: Colors.black54)),

              // rating
              Row(
                spacing: 10,
                children: [
                  Icon(CupertinoIcons.star_fill, size: 18, color: Colors.amber),
                  Text(widget.book.rating.toString()),
                ],
              ),

              SizedBox(height: 6),

              // price
              Container(
                padding: .all(10),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      'Price:',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: .w500,
                        fontSize: 16,
                      ),
                    ),

                    Text(
                      '\$ ${widget.book.price}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: .w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 6),

              // desc
              Text(
                'Descriptions:',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: .w500,
                  fontSize: 16,
                ),
              ),
              Text(
                widget.book.description,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
