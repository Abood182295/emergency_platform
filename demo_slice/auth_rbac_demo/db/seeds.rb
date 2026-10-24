# Synthetic local-only demonstration accounts. Never use these credentials in production.
[
  { email: "admin@demo.local", password: "AdminDemo!2026", role: :administrator },
  { email: "coordinator@demo.local", password: "CoordinatorDemo!2026", role: :coordinator },
  { email: "responder@demo.local", password: "ResponderDemo!2026", role: :responder }
].each do |attributes|
  user = User.find_or_initialize_by(email: attributes[:email])
  user.assign_attributes(password: attributes[:password], password_confirmation: attributes[:password], role: attributes[:role])
  user.save!
end
