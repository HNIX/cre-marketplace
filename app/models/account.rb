class Account < ActiveRecord::Base
  RESTRICTED_SUBDOMAINS = %w(www)
  # after_create :create_tenant
  belongs_to :owner, class_name: 'User'
  has_many :listings

  validates :owner, presence: true

  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' },
                        exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' }

  accepts_nested_attributes_for :owner

  before_validation :downcase_subdomain


  private

    def create_tenant
      Apartment::Tenant.create(subdomain)
    end

    def downcase_subdomain
      self.subdomain = subdomain.try(:downcase)
    end


end
