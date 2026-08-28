# frozen_string_literal: true

module BookReact
  module Relations
    class Books < BookReact::DB::Relation
      schema :books, infer: true

      use :pagination
      per_page 2
    end
  end
end
