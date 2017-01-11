class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:guest, :admin]

  has_many :programmes, inverse_of: :user

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.user.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def self.role_attributes_for_select
    roles.map do |role, role_value|
      human_enum_name(role, role_value)
    end
  end
end
