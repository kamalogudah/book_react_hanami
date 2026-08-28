# frozen_string_literal: true

module BookReact
  module Views
    module InertiaExample
      class Show < BookReact::View
        expose :page, layout: true
        expose :ssr_head, layout: true
        expose :ssr_body, layout: true
      end
    end
  end
end
