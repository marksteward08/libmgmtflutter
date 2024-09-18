List book = [
  {
    'bookTitle' : 'Silent Patient',
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/1250301696-L.jpg',
    'bookAuthor' : 0,
    'bookPublisher' : 0,
  },
  {
    'bookTitle' : 'Crawdads Sing',
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/0735219095-L.jpg',
    'bookAuthor' : 0,
    'bookPublisher' : 0,
  },
  {
    'bookTitle' : 'Educated',
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/0399590501-L.jpg',
    'bookAuthor' : 0,
    'bookPublisher' : 1,
  },
  {
    'bookTitle' : 'Night Circus',
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/0385534639-L.jpg',
    'bookAuthor' : 1,
    'bookPublisher' : 1,
  },
  {
    'bookTitle' : 'Circe',
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/0316556343-L.jpg',
    'bookAuthor' : 1,
    'bookPublisher' : 2,
  }
];

List authors = [
  {
    'firstName' : 'Tara',
    'middleName' : '',
    'lastName' : 'Westover',
  },
  {
    'firstName' : 'Erin',
    'middleName' : 'Morgenstern',
    'lastName' : '',
  }
];

List publishers = [
  {
    'publisherName' : 'Random House',
  },
  {
    'publisherName' : 'HarperCollins',
  },
  {
    'publisherName' : 'HarperCollins',
  }
];

List members = [
  {
    'name': 'Otep otep',
    'address': 'Biringan City',
  },
  {
    'name' : 'Panis panis',
    'address' : 'Mindanao',
  },
  {
    'name' : 'Hev Abi',
    'address' : 'Luzon',
  }
];

List borrowedBooks = [
  {
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/1250301696-L.jpg',
    'borrowedBook' : 0,
    'borrower' : 0,
    'borrowDate' : DateTime.now(),
    'returnDate' : DateTime.now().add(Duration(days: 14)),
  },
  {
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/0735219095-L.jpg',
    'borrowedBook' : 1,
    'borrower' : 1,
    'borrowDate' : DateTime.now().subtract(Duration(days: 5)),
    'returnDate' : DateTime.now().add(Duration(days: 9)),
  },
  {
    'bookCover' : 'https://covers.openlibrary.org/b/isbn/0399590501-L.jpg',
    'borrowedBook' : 2,
    'borrower' : 2,
    'borrowDate' : DateTime.now().subtract(Duration(days: 10)),
    'returnDate' : DateTime.now().add(Duration(days: 4)),
  }
];
