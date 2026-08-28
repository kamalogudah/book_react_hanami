import { Link, router, usePage } from "@inertiajs/react";

export default function Show({ book }) {
  const { flash } = usePage().props;

  const destroy = () => {
    if (confirm(`Delete "${book.title}"?`)) {
      router.delete(`/books/${book.id}`);
    }
  };

  return (
    <div>
      {flash?.notice && <p>{flash.notice}</p>}
      {flash?.alert && <p>{flash.alert}</p>}

      <h1>{book.title}</h1>
      <p>By {book.author}</p>

      <p>
        <Link href={`/books/${book.id}/edit`}>Edit</Link>
        {" | "}
        <Link href="/books">Back to books</Link>
      </p>

      <button type="button" onClick={destroy}>
        Delete
      </button>
    </div>
  );
}
