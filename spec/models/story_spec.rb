require 'spec_helper'

describe Story do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :link }
    it { should validate_uniqueness_of :link }
  end

  describe "associations" do
    it { should belong_to :user }
  end
end
