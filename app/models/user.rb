class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_one :profile, dependent: :destroy

  has_many :transactions, dependent: :destroy
  has_many :teaching_bookings, :class_name => "Booking", :foreign_key => "mentor_id", dependent: :destroy
  has_many :learning_bookings, :class_name => "Booking", :foreign_key => "mentee_id", dependent: :destroy

  before_create :add_profile
  after_initialize :set_default_role, :if => :new_record?

  default_scope {}
  scope :mentors, -> { where role: 1 }
  scope :admins, -> { where role: 2 }

  enum role: [:mentee, :mentor, :admin]

  def set_default_role
    self.role ||= :mentee
  end

  def self.mentee_role
    :mentee
  end

  def self.mentor_role
    :mentor
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
    first_name + " " + last_name
  end
  protected

  def add_profile
  	self.profile = Profile.build_new_profile
  end

end
