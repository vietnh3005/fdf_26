class Supports::Order
  attr_reader :order

  def users
    @users = User.all
  end
end
