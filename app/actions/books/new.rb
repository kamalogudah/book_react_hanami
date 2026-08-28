# frozen_string_literal: true

module BookReact
  module Actions
    module Books
      class New < BookReact::Action
        include InertiaHanami::Action

        def handle(_request, _response)
          inertia_render "Books/New"
        end
      end
    end
  end
end
