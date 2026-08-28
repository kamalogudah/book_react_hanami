import { Link, usePage } from "@inertiajs/react";

export default function Index({ books }) {
  const { flash } = usePage().props;

  return (
    <div>
      {flash?.notice && <p>{flash.notice}</p>}
      {flash?.alert && <p>{flash.alert}</p>}

      <h1>Books</h1>

      <p>
        <Link href="/books/new">New book</Link>
      </p>

      <ul>
        {books.map((book) => (
          <li key={book.id}>
            <Link href={`/books/${book.id}`}>{book.title}</Link>, by {book.author}
          </li>
        ))}
      </ul>
    </div>
  );
}
