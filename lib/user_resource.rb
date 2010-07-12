class UserResource < RedmineResource
  self.collection_name='users'
  self.format = :json

  def self.element_path(id, prefix_options = {}, query_options = nil)
    prefix_options, query_options = split_options(prefix_options) if query_options.nil?
    "#{prefix(prefix_options)}#{collection_name}/show/#{id}#{query_string(query_options)}"
  end

end

