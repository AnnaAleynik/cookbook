admin_user_params = {
  first_name: "Sherlock",
  last_name: "Holmes",
  email: "sherlock.holmes@cookbook.com",
  login: "sherlock.holmes",
  password: "12345678",
  roles: ["manager", "coordinator", "moderator"]
}
User.create!(admin_user_params)

manager_user_params = {
  first_name: "Jeong",
  last_name: "Hoseok",
  email: "jeong.hoseok@cookbook.com",
  login: "jeong.hoseok",
  password: "12345678",
  roles: ["manager"]
}
User.create!(manager_user_params)

account_user_params = {
  first_name: "John",
  last_name: "Smith",
  email: "john.smith@gmail.com",
  login: "john.smith",
  password: "12345678"
}
User.create!(account_user_params)
