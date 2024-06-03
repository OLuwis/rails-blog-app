require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  # Routing Tests
  describe "routes" do
    it {
      expect(post: "/en/posts/1/comments").to route_to(controller: "comments", action: "create", locale: "en", post_id: "1")
    }

    it {
      expect(delete: "/en/posts/1/comments/1").to route_to(controller: "comments", action: "destroy", locale: "en", post_id: "1", id: "1")
    }
  end
end
