# frozen_string_literal: true

module BookReact
  module Actions
    module Books
      class Destroy < BookReact::Action
        include InertiaHanami::Action
        include Deps["repos.book_repo"]

        params do
          required(:id).filled(:integer)
        end

        def handle(request, response)
          book_repo.delete(request.params[:id])

          response.flash[:notice] = "Book deleted"
          response.redirect_to routes.path(:books)
        end
      end
    end
  end
end
