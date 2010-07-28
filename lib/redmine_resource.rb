class RedmineResource < ActiveResource::Base
  #self.site = "#{CodeUrl}#{Spartanlogin}:#{Spartanpassword}@#{Spartanhost}"
  self.site = "#{$CodeUrl}#{$CodeHost}"

end

