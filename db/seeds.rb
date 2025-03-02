r1 = Role.create({ name: 'Admin', description: 'Adminisztrátor' })
r2 = Role.create({ name: 'Tanulo', description: 'Tanfolyami hallgató' })

u1 = User.create({ name: 'admin', email: 'admin@example.com', password: 'aaaaaa', password_confirmation: 'aaaaaa', role_id: r1.id })
u2 = User.create({ name: 'Tanulo', email: 'tanulo@example.com', password: 'aaaaaa', password_confirmation: 'aaaaaa', role_id: r2.id })

