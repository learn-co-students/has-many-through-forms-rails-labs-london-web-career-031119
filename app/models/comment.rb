class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user
  #params["comment"]=>{"content"=>"Comment 4", "post_id"=>"1", "user_id"=>"1", "user_attributes"=>{"username"=>""}}

  def user_attributes=(hash)
    if !hash[:username].blank?
      user = User.find_or_create_by(hash)
      self.user = user
    end
  end

end
