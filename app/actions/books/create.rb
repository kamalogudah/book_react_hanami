# frozen_string_literal: true

module BookReact
  module Actions
    module Books
      class Create < BookReact::Action
        include InertiaHanami::Action
        include Deps["repos.book_repo"]

        params do
          required(:book).hash do
            required(:title).filled(:string)
            required(:author).filled(:string)
          end
        end

        def handle(request, response)
          if request.params.valid?
            book = book_repo.create(request.params[:book])

            response.flash[:notice] = "Book created"
            response.redirect_to routes.path(:book, id: book[:id])
          else
            response.flash.now[:alert] = "Could not create book"
            share_inertia_errors(request.params.errors)
            response.redirect_to routes.path(:new_book)
          end
        end
      end
    end
  end
end
