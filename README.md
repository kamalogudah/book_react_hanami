# BookReact

🌸 A Hanami app that renders its pages through [Inertia.js](https://inertiajs.com/) with
[React](https://react.dev) instead of server-rendered ERB templates.

It implements the ["Building a web app"](https://hanakai.org/learn/hanami/v3.0/getting-started/building-a-web-app)
tutorial's bookshelf app (books with a title and author, full CRUD), using
[inertia_hanami](https://github.com/kamalogudah/inertia_hanami) as the server-side Inertia
adapter and React components as the client-side pages.

## Stack

- [Hanami 3.0](https://hanakai.org) — Ruby web framework (actions, views, routing, `hanami-db`)
- [inertia_hanami](https://github.com/kamalogudah/inertia_hanami) — server-side Inertia.js protocol adapter for Hanami
- [React](https://react.dev) + [@inertiajs/react](https://inertiajs.com/) — client-side pages
- `hanami-assets` (esbuild), configured with `esbuildOptions.jsx = "automatic"` to compile `.jsx` pages into the asset bundle
- SQLite (via `hanami-db` / ROM / Sequel)

## Getting started

- Set up the project with `bin/setup` (installs gems, npm packages, and prepares the database)
- Run the server with `bin/dev` (starts Puma **and** the esbuild watcher together, via `Procfile.dev`)
- View the app at [http://localhost:2300](http://localhost:2300)
- Run the tests with `bundle exec rake`

`bin/dev` is the one command you need — it runs both processes `hanami server` needs to serve
React pages with live-reloading assets:

```
web: bundle exec hanami server
assets: bundle exec hanami assets watch
```

If you'd rather run them by hand in two terminals:

```bash
bundle exec hanami assets watch   # compiles app/assets/js/**/*.jsx on change
bundle exec hanami server         # http://localhost:2300
```

For a production-style one-off build instead of the watcher:

```bash
bundle exec hanami assets compile
```

## How the Inertia + React pieces fit together

- `config/app.rb` registers the Inertia middleware stack (`Version`, `Redirects`, `Csrf`), enables
  cookie sessions (required for CSRF/flash/validation errors), and parses JSON request bodies
  (Inertia's client sends `application/json`, not form-encoded bodies).
- `app/action.rb` / `app/view.rb` are the app's base `Action`/`View` classes. Every action includes
  `InertiaHanami::Action` and every view exposes `page`/`ssr_head`/`ssr_body` to the layout, so
  individual actions/views only add what's specific to that page.
- `app/templates/layouts/app.html.erb` renders `inertia_root(page: page)` — a `<script
  data-page="app" type="application/json">` tag with the page data, plus the `<div id="app">`
  mount point.
- `app/assets/js/app.jsx` is the client entrypoint: `createInertiaApp` resolves a component name
  (e.g. `"Books/Index"`) to a React component and renders it with `react-dom/client`. Because
  `hanami-assets` bundles with esbuild (not Vite), there's no `import.meta.glob` — every page
  component is imported explicitly in the `pages` map in that file.
- `app/assets/js/pages/**/*.jsx` are the Inertia pages themselves (`Home/Index`, `Books/Index`,
  `Books/Show`, `Books/New`, `Books/Edit`), matching the component names passed to
  `inertia_render` in the actions under `app/actions/`.
- `config/assets.js` sets `esbuildOptions.jsx = "automatic"` so esbuild can compile JSX without an
  explicit `React` import in every file.

## The bookshelf tutorial

- `config/routes.rb` — `resources :books`
- `config/db/migrate/*_create_books.rb` — the `books` table
- `app/relations/books.rb`, `app/repos/book_repo.rb` — data access
- `app/actions/books/*.rb` — index/show/new/create/edit/update/destroy, each calling
  `inertia_render` with the relevant React component and props
- `app/assets/js/pages/Books/*.jsx` — the corresponding React pages, using
  `@inertiajs/react`'s `Link`, `useForm`, and `router` helpers for navigation, forms, and deletes

## Useful links

- [Hanami](https://hanakai.org/hanami)
- [Hanami guides](https://hanakai.org/learn#hanami)
- [inertia_hanami](https://github.com/kamalogudah/inertia_hanami)
- [Inertia.js](https://inertiajs.com/)
