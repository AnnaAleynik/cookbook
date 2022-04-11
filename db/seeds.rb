admin_user_params = {
  first_name: "Anna",
  last_name: "Aleynik",
  email: "anna.aleynik@flatsatck.com",
  login: "anna.aleynik",
  password: "12345678",
  roles: ["manager", "coordinator", "moderator"]
}
User.create!(admin_user_params)