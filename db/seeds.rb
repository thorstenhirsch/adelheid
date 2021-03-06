# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ArtifactCategory.create!( name: "file" )
ArtifactCategory.create!( name: "db" )

Configuration.set("applications", 0)
Configuration.set("default_application_name", "default")
Configuration.set("environment_groups", 0)

      # custom colors
      # environment groups
      # t.boolean :use_authentication
      # t.string :authentication_type
      # t.string :http_user
      # t.string :http_password_digest
      # t.boolean :create_artifacts_on_the_fly
