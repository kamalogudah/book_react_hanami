import "../css/app.css";

import { createInertiaApp } from "@inertiajs/react";
import { createRoot } from "react-dom/client";

import HomeIndex from "./pages/Home/Index.jsx";
import BooksIndex from "./pages/Books/Index.jsx";
import BooksShow from "./pages/Books/Show.jsx";
import BooksNew from "./pages/Books/New.jsx";
import BooksEdit from "./pages/Books/Edit.jsx";
import InertiaExampleShow from "./pages/InertiaExample/Show.jsx";

const pages = {
  "Home/Index": HomeIndex,
  "Books/Index": BooksIndex,
  "Books/Show": BooksShow,
  "Books/New": BooksNew,
  "Books/Edit": BooksEdit,
  "InertiaExample/Show": InertiaExampleShow,
};

createInertiaApp({
  resolve: (name) => {
    const page = pages[name];
    if (!page) throw new Error(`Unknown Inertia page component: ${name}`);
    return page;
  },
  setup({ el, App, props }) {
    createRoot(el).render(<App {...props} />);
  },
});
