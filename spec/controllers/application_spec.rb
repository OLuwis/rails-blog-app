require "rails_helper"

RSpec.describe ApplicationController, type: :controller do
  # Callbacks Tests
  describe "callbacks" do
    it {
      should use_around_action(:switch_locale)
    }

    it {
      should use_before_action(:configure_permitted_parameters)
    }
  end
end
