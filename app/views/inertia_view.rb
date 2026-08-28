# auto_register: false
# frozen_string_literal: true

module BookReact
  module Views
    # Base view for actions that call `inertia_render`. Full-page (non-XHR)
    # loads still go through Hanami's normal view/layout rendering, so the
    # layout's `page`/`ssr_head`/`ssr_body` locals need to come from
    # somewhere - `InertiaHanami::Renderer` sets them as response exposures.
    class InertiaView < BookReact::View
      expose :page, layout: true
      expose :ssr_head, layout: true
      expose :ssr_body, layout: true
    end
  end
end
