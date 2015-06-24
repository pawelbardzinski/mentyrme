class ProfilePolicy 

 	attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
  	true
  end

  def edit?
  	@user.is_mentor?
  end

  def update?
  	@user.is_mentor?
  end

  def photos?
    @user.is_mentor?
  end
end
