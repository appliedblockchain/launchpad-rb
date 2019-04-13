class Post
  include DataMapper::Resource

  property :id, Serial
  property :digest, Text
  property :title, Text
  property :text, Text

  before :create, :hash_contents

  def hash_contents
    self.digest = Digest::SHA2.hexdigest "#{title}|#{text}"
  end

end
