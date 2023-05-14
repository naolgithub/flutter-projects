class Book {
  String id;
  String title;
  String authors;
  String description;
  String publisher;
  Book(this.id, this.title, this.authors, this.description, this.publisher);
  /*
  we also need a named constructor that takes a map and returns a Book. 
  This will be useful when parsing the JSON data and transforming it into a list
  of Book objects
  */
  factory Book.fromJson(Map<String, dynamic> parsedJson) {
    final String id = parsedJson['id'];
    final String title = parsedJson['volumeInfo']['title'];
    String authors = (parsedJson['volumeInfo']['authors'] == null)
        ? ''
        : parsedJson['volumeInfo']['authors'].toString();
    authors = authors.replaceAll('[', '');
    authors = authors.replaceAll(']', '');
    final String description = (parsedJson['volumeInfo']['description'] == null)
        ? ''
        : parsedJson['volumeInfo']['description'];
    final String publisher = (parsedJson['volumeInfo']['publisher'] == null)
        ? ''
        : parsedJson['volumeInfo']['publisher'];
    return Book(
      id,
      title,
      authors,
      description,
      publisher,
    );
  }
  /*
  In order to complete Book class, we need to create the toJson() method
  that returns the values of the class instance in the JSON format.
  */
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'authors': authors,
      'description': description,
      'publisher': publisher
    };
  }
}
