import { Link } from "@inertiajs/react";

export default function Index() {
  return (
    <div>
      <h1>Welcome to Book React</h1>
      <p>
        <Link href="/books">View books</Link>
      </p>
    </div>
  );
}
