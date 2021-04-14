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

# Create task lists & tasks
u1 = User.find(1)
tl1 = u1.task_lists.create(name: "Daily Todo")
tl2 = u1.task_lists.create(name: "Weekly Todo")
tl3 = u1.task_lists.create(name: "Monthly Todo")
task_3_1 = tl3.tasks.create(name: "Sprint planning")
task_3_2 = tl3.tasks.create(name: "Run retro")

u2 = User.find(2)
tl4 = u2.task_lists.create(name: "4/19 Todo")
tl5 = u2.task_lists.create(name: "4/20 Todo")
tl6 = u2.task_lists.create(name: "4/21 Todo")
task_6_1 = tl6.tasks.create(name: "Hard deletes planning")
task_6_2 = tl6.tasks.create(name: "French practice")
task_6_3 = tl6.tasks.create(name: "Bake vanilla cake")
