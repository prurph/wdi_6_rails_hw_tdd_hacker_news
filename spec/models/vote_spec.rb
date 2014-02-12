describe Vote do
  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_uniqueness_of(:user_id).scoped_to(:votable_id,
          :votable_type).with_message('already voted!') }
  end

  describe "associations" do
    it { should belong_to :votable }
    it { should belong_to :user }
  end
end
