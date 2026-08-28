# frozen_string_literal: true

module BookReact
  module Actions
    module InertiaExample
      class Show < BookReact::Action
        include InertiaHanami::Action

        def handle(_request, _response)
          inertia_render("InertiaExample/Show", props: { greeting: "Hello from inertia_hanami" })
        end
      end
    end
  end
end
