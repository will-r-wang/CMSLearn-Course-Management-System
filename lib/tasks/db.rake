namespace :db do
  desc 'Drop, create, migrate, and seed the development database'
  task reseed: [ 'db:drop', 'db:create', 'db:migrate', 'db:seed' ] do
    puts 'Reseeding completed.'
  end
end
