// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Library {
    struct Book {
        string title;
        string author;
        uint bookId;
        address registrant;
    }
    Book[] public book;

    function addBook(string memory _title, string memory _author) external {
        book.push(
            Book({
                title: _title,
                author: _author,
                bookId: book.length,
                registrant: msg.sender
            })
        );
    }

    function getBook(
        uint _bookId
    ) external view returns (string memory, string memory) {
        return (book[_bookId].title, book[_bookId].author);
    }

    function update(
        uint _bookId,
        string memory _title,
        string memory _author
    ) external {
        require(
            msg.sender == book[_bookId].registrant,
            "You must have been the one to add the book to change the record!"
        );
        book[_bookId].title = _title;
        book[_bookId].author = _author;
    }
}
