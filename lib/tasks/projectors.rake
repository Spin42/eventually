namespace :projectors do
  task :start => :environment do
    pids = []
    Rails.application.config.projectors.each do | projector_name, projector_attributes |
      class_name = projector_attributes[:class_name]
      pid = fork do
        class_name.camelize.constantize.new.start
      end
      pids.push(pid)
    end
    Signal.trap("SIGINT") do
      puts "Terminating..."
      pids.each do |pid|
        puts "Sending sig term to #{pid}."
        Process.kill("TERM", pid)
      end
    end
    Process.wait
  end
end
