class SubdomainPresent
  def self.matches?(request)
    subdomains = %w{ www admin }
    request.subdomain.present? && !subdomains.include?(request.subdomain)
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainPresent) do
    root 'listings#index', as: :subdomain_root
    devise_for :users
    resources :users, only: :index
    resources :listings
  end

  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
    resources :listings, only: [:index, :show]
    devise_for :investors
    get "*id" => 'pages#show', as: :page, format: false
  end
end
