crews = Crew.create!([
  { name: 'Mad Hamsters', native_name: 'Бешеные Хомяки' },
  { name: 'Freeloaders', native_name: 'Халявщики' },
  { name: 'Black Cat', native_name: 'Черный Кот' },
  { name: 'Kill All Humans', native_name: 'Убить всех человеков', active: false }
])


accounts_data = [
  { login: 'hamster', email: 'michael.protsenko@gmail.com', password: 'supersecret', crew: crews[0], admin: true },
  { login: 'fixinya', email: 'mrfix@yahoo.com', password: 'hrenugadaesh', crew: crews[1], financier: true },
  { login: 'jsmith', email: 'john.smith@gmail.com', password: '123456789', crew: crews[2] },
  { login: 'robot', email: 'robot@gmail.com', password: 'slavarobotam', crew: crews[3] }
]
accounts_data.each do |account|
  # account[:email_confirmation] = account[:email]
  account[:password_confirmation] = account[:password]
  account[:crew_lead] = true
  account[:active] = true
  account[:activated_at] = Time.now
end
accounts = UserAccount.create!(accounts_data)


participants = [
  { last_name: 'Pupkin', first_name: 'Vasya', user_account: accounts[0], primary: true },
  { last_name: 'Hvost', first_name: 'Gwen', user_account: accounts[0] },
  { last_name: 'Fix', first_name: 'Mister', user_account: accounts[1], primary: true },
  { last_name: 'Smith', first_name: 'John', user_account: accounts[2], primary: true },
  { last_name: 'Parker', first_name: 'Brad', user_account: accounts[3], primary: true }
]
participants.each do |participant|
  participant[:approved_at] = Time.now
  participant[:approved_by] = 'admin'

  if participant[:user_account].crew.active?
    participant[:payment_confirmed_at] = Time.now
    participant[:payment_confirmed_by] = 'ryeliseyev'
    participant[:payment_notes] = "Paid as crew lead."
  end
  participant[:created_by] = 'admin'
  participant[:updated_by] = 'admin'
end

Participant.create!(participants)
