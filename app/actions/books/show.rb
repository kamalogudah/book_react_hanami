# frozen_string_literal: true

module BookReact
  module Actions
    module Books
      class Show < BookReact::Action
        include InertiaHanami::Action
        include Deps["repos.book_repo"]

        def handle(request, response)
          book = book_repo.get(request.params[:id])

          inertia_render "Books/Show", props: { book: book.to_h }
        end
      end
    end
  end
end
