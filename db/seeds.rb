User.find_or_create_by!(email: "admin@hail.gov.sa") do |u|
  u.name = "System Administrator"
  u.password = "Admin123!"
  u.role = "administrator"
  u.active = true
end

User.find_or_create_by!(email: "responder@hail.gov.sa") do |u|
  u.name = "Emergency Responder"
  u.password = "Responder123!"
  u.role = "responder"
  u.active = true
end