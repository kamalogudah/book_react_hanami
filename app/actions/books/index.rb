# frozen_string_literal: true

module BookReact
  module Actions
    module Books
      class Index < BookReact::Action
        include InertiaHanami::Action
        include Deps["repos.book_repo"]

        def handle(request, response)
          page = request.params[:page] || 1
          per_page = request.params[:per_page] || 2

          inertia_render "Books/Index", props: {
            books: book_repo.all_by_title(page:, per_page:).map(&:to_h)
          }
        end
      end
    end
  end
end
