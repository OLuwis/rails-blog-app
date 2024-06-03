require "rails_helper"

RSpec.describe PostsController, type: :controller do
  # Routing Tests
  describe "routes" do
    it {
      expect(get: "/en/posts").to route_to(controller: "posts", action: "index", locale: "en")
    }

    it {
      expect(post: "/en/posts").to route_to(controller: "posts", action: "create", locale: "en")
    }

    it {
      expect(get: "/en/posts/new").to route_to(controller: "posts", action: "new", locale: "en")
    }

    it {
      expect(get: "/en/posts/1/edit").to route_to(controller: "posts", action: "edit", locale: "en", id: "1")
    }

    it {
      expect(get: "/en/posts/1").to route_to(controller: "posts", action: "show", locale: "en", id: "1")
    }

    it {
      expect(patch: "/en/posts/1").to route_to(controller: "posts", action: "update", locale: "en", id: "1")
    }

    it {
      expect(put: "/en/posts/1").to route_to(controller: "posts", action: "update", locale: "en", id: "1")
    }

    it {
      expect(delete: "/en/posts/1").to route_to(controller: "posts", action: "destroy", locale: "en", id: "1")
    }
  end
end
