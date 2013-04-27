require 'spec_helper.rb'

describe 'Comments' do

  let!(:user) { create :user }
  let!(:founder) { create :founder }
  let!(:post_comment) { create :post_comment }
  let!(:event_comment) { create :event_comment }
  let!(:valid_attributes) { attributes_for :comment }

  context 'success' do

    it 'should add new comment from post show page given proper attributes' do
      sign_in_as!(post_comment.user)
      visit post_path(post_comment.commentable)
      fill_in 'comment_body', :with => valid_attributes[:body]

      expect {
        click_button 'Create Comment'
      }.to change(Comment, :count).by(1)

      page.should have_content 'Comment created'
      current_path.should == post_path(post_comment.commentable)
    end

    it 'should add new comment from event show page given proper attributes' do
      sign_in_as!(event_comment.user)
      visit event_path(event_comment.commentable)
      fill_in 'comment_body', :with => valid_attributes[:body]

      expect {
        click_button 'Create Comment'
      }.to change(Comment, :count).by(1)

      page.should have_content 'Comment created'
      current_path.should == event_path(event_comment.commentable)
    end

    it 'should delete his own comment' do
      sign_in_as!(post_comment.user)
      visit post_path(post_comment.commentable)
      expect {
        click_link "delete_comment_#{post_comment.id}"
      }.to change(Comment, :count).by(-1)

      page.should have_content 'Comment destroyed'
      current_path.should == post_path(post_comment.commentable)
    end

    it 'founder should delete comments from others' do
      sign_in_as!(founder)
      visit post_path(post_comment.commentable)
      expect {
        click_link "delete_comment_#{post_comment.id}"
      }.to change(Comment, :count).by(-1)

      page.should have_content 'Comment destroyed'
      current_path.should == post_path(post_comment.commentable)
    end

  end

  context 'failure' do

    it 'should not be able to comment if user is not logged in' do
      visit post_path(post_comment.commentable)
      page.should have_css(".max_width[disabled]")
      page.should have_xpath("//textarea[@disabled='disabled']")
      find_button('Create Comment')[:class].should eq 'btn btn-primary disabled'
    end
  end

end
