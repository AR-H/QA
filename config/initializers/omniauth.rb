Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'zoPII0tO3iWvj4xXcYlJYg', 'Op3BBSrJdI0P4ujubExRT6bmtB0hQt54u9OV4hQnE'
  provider :github, '87ab7b2fece8288ecf9c', '2e49ba39470a3e8f2896e0be482fa4c7a77385a5'
end
