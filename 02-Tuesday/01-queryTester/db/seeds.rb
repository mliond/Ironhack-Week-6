User.destroy_all
Task.destroy_all

users = User.create([
  {name: 'John Doe',  email: 'john@doe.com',   active: true},
  {name: 'John Smith',  email: 'john@smith.com'},
  {name: 'Jane Doe',  email: 'jane@doe.com'}
])

tasks = Task.create([
  {name: 'User 1 Task 1',  status: 'pending', user_id: users[0].id},
  {name: 'User 1 Task 2',  status: 'pending', user_id: users[0].id},
  {name: 'User 2 Task 1',  status: 'pending', user_id: users[1].id},
  {name: 'User 2 Task 2',  status: 'done'   , user_id: users[1].id},
  {name: 'User 3 Task 1',  status: 'pending', user_id: users[2].id},
  {name: 'User 3 Task 2',  status: 'done'   , user_id: users[2].id},
  {name: 'User 3 Task 3',  status: 'in the works', user_id: users[2].id}
])


