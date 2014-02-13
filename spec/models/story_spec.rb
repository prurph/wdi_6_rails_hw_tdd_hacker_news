require 'spec_helper'

describe Story do
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
        10.times { create(:story_vote, votable: @story, value: 1) }
        expect(@story.vote_score).to eq 10
      end

      it 'should be -10 when downvoted 10 times' do
        10.times { create(:story_vote, votable: @story, value: -1) }
        expect(@story.vote_score).to eq -10
      end
    end
    describe '.top_30' do
      before do
        40.times {
          story = create(:story)
          create(:story_vote, votable: story, value: rand(1000))
        }
      end
      it 'should return 30 stories' do
        expect(Story.top_30.count).to eq(30)
      end
    end
  end
end
