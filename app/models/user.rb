class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :profile

  has_many :transactions

  before_create :add_profile
  after_initialize :set_default_role, :if => :new_record?

  default_scope {}
  scope :mentors, -> { where role: self.mentor_role }
  scope :admins, -> { where role: self.admin_role }

  enum role: [:mentee, :mentor, :admin]

  def set_default_role
    self.role ||= :mentee
  end

  def self.mentee_role
    :mentee
  end

  def self.mentor_role
    self.mentor ##changed as :mentor was not returning 1
  end

  def self.admin_role
    :admin
  end

  def is_mentor?
    self.role == 'mentor' ? true : false
  end

  def is_admin?
    self.role == 'admin' ? true :false
  end

  def set_as_mentor
    self.role = :mentor
    self.profile.build_out_mentor_profile
  end

  def full_name
    first_name << " " << last_name
  end
  protected

  def add_profile
  	self.profile = Profile.build_new_profile
  end

end
