# frozen_string_literal: true

module BookReact
  class Routes < Hanami::Routes
    root to: "home.index"
    resources :books

    get "/inertia-example", to: "inertia_example.show"
  end
end
