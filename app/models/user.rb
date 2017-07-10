class User < ApplicationRecord
  acts_as_authentic { |c| c.crypto_provider = Authlogic::CryptoProviders::Sha512}
end
