@applications.inject([]) do |applications, application|
  applications.push render(application)
  applications
end.to_json
