require 'spec_helper'

describe Story do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :link }
    it { should validate_uniqueness_of :link }
    it { should validate_presence_of :user_id }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many :comments }
  end

  describe "methods" do
    before(:each) do
      @story = create(:story)
    end
    describe '#vote_score' do
      it 'should equal 10 when upvoted 10 times' do
        10.times { create(:vote, votable: @story, value: 1) }
        expect(@story.vote_score).to eq 10
      end

      it 'should be -10 when downvoted 10 times' do
        10.times { create(:vote, votable: @story, value: -1) }
        expect(@story.vote_score).to eq -10
      end
    end
    describe '.top_30' do
      before do
        40.times { create(:story) }
      end
      it 'should return 30 stories' do
        expect(Story.top_30.count).to eq(30)
      end
    end
  end
end
