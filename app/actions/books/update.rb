# frozen_string_literal: true

module BookReact
  module Actions
    module Books
      class Update < BookReact::Action
        include InertiaHanami::Action
        include Deps["repos.book_repo"]

        params do
          required(:id).filled(:integer)
          required(:book).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            book = book_repo.update(request.params[:id], request.params[:book])

            response.flash[:notice] = "Book updated"
            response.redirect_to routes.path(:book, id: book[:id])
          else
            response.flash.now[:alert] = "Could not update book"
            share_inertia_errors(request.params.errors)
            response.redirect_to routes.path(:edit_book, id: request.params[:id])
          end
        end
      end
    end
  end
end
