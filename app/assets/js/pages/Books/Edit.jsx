import { Link, useForm, usePage } from "@inertiajs/react";

export default function Edit({ book }) {
  const { errors } = usePage().props;
  const { data, setData, patch, processing } = useForm({
    book: { title: book.title, author: book.author },
  });

  const submit = (e) => {
    e.preventDefault();
    patch(`/books/${book.id}`);
  };

  return (
    <div>
      <h1>Edit book</h1>

      <form onSubmit={submit}>
        <div>
          <label htmlFor="title">Title</label>
          <input
            id="title"
            type="text"
            value={data.book.title}
            onChange={(e) => setData("book", { ...data.book, title: e.target.value })}
          />
          {errors?.book?.title && <p>{errors.book.title}</p>}
        </div>
        <div>
          <label htmlFor="author">Author</label>
          <input
            id="author"
            type="text"
            value={data.book.author}
            onChange={(e) => setData("book", { ...data.book, author: e.target.value })}
          />
          {errors?.book?.author && <p>{errors.book.author}</p>}
        </div>
        <div>
          <button type="submit" disabled={processing}>
            Update
          </button>
        </div>
      </form>

      <p>
        <Link href={`/books/${book.id}`}>Back to book</Link>
      </p>
    </div>
  );
}
