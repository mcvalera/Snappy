# my user info, etc.

User.create(first_name: "Clarisse", last_name: "Valera", username: "mcvalera", email: "clangvalera@gmail.com", password_hash: "clarisse", img_url: "http://goo.gl/Inoacq")

my_id = User.find_by(email: "clangvalera@gmail.com").id

my_imgs = ["http://goo.gl/FQHSKE", "http://goo.gl/e8Q2QX", "http://goo.gl/FGxs0V", "http://goo.gl/YrQHyM", "http://goo.gl/V3hZhY"]

Location.create(name: "Coit Tower", latitude: 37.8025, longitude: 122.4058, user_id: 1)



