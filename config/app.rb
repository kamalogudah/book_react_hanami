# frozen_string_literal: true

require "hanami"
require "hanami/middleware/body_parser"

require "inertia_hanami"
require "inertia_hanami/middleware/version"
require "inertia_hanami/middleware/redirects"
require "inertia_hanami/middleware/csrf"
module BookReact
  class App < Hanami::App
    config.actions.sessions = :cookie, {
      key: "book_react.session",
      secret: settings.session_secret,
      expire_after: 60 * 60 * 24 * 365
    }

    # Inertia's client XHR requests send `application/json` bodies (not
    # form-encoded), so params need JSON parsing to reach action `params`.
    config.middleware.use Hanami::Middleware::BodyParser, :json

    config.middleware.use InertiaHanami::Middleware::Version
    config.middleware.use InertiaHanami::Middleware::Redirects
    config.middleware.use InertiaHanami::Middleware::Csrf
  end
end
