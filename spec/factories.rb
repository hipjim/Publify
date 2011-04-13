# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Cristian Popovici"
  user.email                 "cristian.popovici@publify.ro"
  user.telephone	     "0256200503"
  user.password              "foobar"
  user.password_confirmation "foobar"
  user.location_name         "Piata Romanilor"
end

