require 'spec_helper'

describe Comment do
  describe "validations" do
    it { should validate_presence_of :story_id }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :body }
  end
  describe "associations" do
    it { should belong_to :user }
    it { should belong_to :story }
  end
end
