# frozen_string_literal: true

module BookReact
  module Actions
    module Home
      class Index < BookReact::Action
        include InertiaHanami::Action

        def handle(_request, _response)
          inertia_render "Home/Index"
        end
      end
    end
  end
end
