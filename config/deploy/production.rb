set :stage, :production

server "app1.spin42.me:221", user: "eventually", roles: %w{web app db}
