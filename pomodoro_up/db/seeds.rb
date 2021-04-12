# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
users = [
    {
        username: 'u1',
        email: 'u1@a.com',
        password: 'p1',
    },
    {
        username: 'u2',
        email: 'u2@a.com',
        password: 'p2',
    },
    {
        username: 'u3',
        email: 'u3@a.com',
        password: 'p3',
    },
]
User.create(users)

# Create task lists
u1 = User.find(1)
u1.task_lists.create(name: "Daily Todo")
