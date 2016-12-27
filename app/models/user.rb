class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_many :user_working_hours
  has_many :time_records, dependent: :destroy
  has_many :coverages, dependent: :destroy
  has_many :memos, dependent: :destroy
  has_many :sellers, dependent: :destroy
  has_many :invoices, dependent: :destroy
  has_many :working_hours, through: :user_working_hours
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable ,:session_limitable, :timeoutable
        # :validatable
  validate :password_complexity
  # validates :password, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/, message: "must include at least one lowercase letter, one uppercase letter, and one digit" }
  # validates :password, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/, message: "must include at least one lowercase letter, one uppercase letter, and one digit" }, on: :update
  acts_as_messageable

  def mailboxer_name
    self.name
  end

  def mailboxer_email(object)
    self.email
  end
  
  def admin?
    role == 'admin'
  end
  def pabaza?
    region == 'Pabaza'
  end
  def rosario?
    region == 'Rosario'
  end
  def pampanga?
    region == 'Pampanga'
  end
  def ne?
    region == 'NE'
  end
  def neta?
    region == 'Neta'
  end
  def tarlac?
    region == 'Tarlac'
  end
  def ilocos?
    region == 'Ilocos'
  end
  def isabela?
    region == 'Isabela'
  end
  def tuguegarao?
    region == 'Tuguegarao'
  end
  def launion?
    region == 'La Union'
  end
  def bufferloc?
    region == 'Buffer Loc'
  end
  def all?
    region == 'All'
  end
  def worker?
    role == 'employee'
  end
  def admin_logistic?
    position == 'Admin-Logistic'
  end
  def wic?
    position == 'WIC'
  end
  def leadstaff?
    position == 'Lead-Staff'
  end
  def leadosb?
    position == 'Lead-OSB'
  end
  def active_for_authentication?
    super && self.is_active?
  end
  def seller?
    position == "DSP" || position == "KAE"
  end
  def inactive_message
    "Sorry, this account has been deactivated."
  end
  def viewcoverage?
    position == 'GSM' || position == 'OM' || position == 'FM' || position == 'SCM' || position == 'ITM' || position == 'HRM' || position == 'DSS' || position == 'ADS'
  end
  def updatecoverage?
    position == 'HRM' || position == 'GSM'
  end
  def ar?
    position == "AR-Staff"
  end
  def cashier?
    position == "Cashier"
  end
  def accnt_sup?
    position == "Accnt-Sup"
  end
  def itm?
    position == 'ITM'
  end
  def fm?
    position == 'FM'
  end
  def creatememo?
    position == 'HRM'
  end
  def updatememo?
    position == 'HRM' || position == 'GSM'
  end
  
    # new function to set the password without knowing the current 
  # password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore. 
  # Instead you should use `pending_any_confirmation`.  
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end
def password_required?
  # Password is required if it is being set, but not for new records
  # !persisted? || !password.blank? || !password_confirmation.blank?
  if !persisted? 
    false
  else
    !password.nil? || !password_confirmation.nil?
  end
end


  def password_complexity
    if password.present? and not password.match(/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\x20-\x7E])/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
    end
  end


end
