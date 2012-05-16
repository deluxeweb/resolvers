module Resolvers
  # this resolver graciously shared by jdelStrother at
  # https://github.com/rails/rails/issues/3855#issuecomment-5028260
  class MobileFallbackResolver < ::ActionView::FileSystemResolver
    def find_templates(name, prefix, partial, details)
      if details[:formats] == [:mobile]
        # Add a fallback for html, for the case where, eg, 'index.html.haml' exists, but not 'index.mobile.haml'
        details = details.dup
        details[:formats] = [:mobile, :html]
      end
      super
    end
  end
end
