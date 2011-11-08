class RedmineResource < ActiveResource::Base
  self.site = "#{$CodeUrl}#{$CodeHost}"

end

class ActiveResource::Base 

private
  # monkey patch !!!
  # ought to cache these somewhere.
  #
  # Tries to find a resource for a given name; if it fails, then the resource is created
  def find_or_create_resource_for(name)
    resource = self.class.const_set(resource_name, Class.new(ActiveResource::Base))
    resource.prefix = self.class.prefix
    resource.site   = self.class.site
    resource
  end
end


