# Copyright:: Copyright (c) 2012, 2013 Megam Systems
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


module Megam
  class Space
      
    def self.list(access_token)
      puts  "-----------------------------Entry list"
      space = self.new
      puts access_token
      ss = space.megam_rest.get_spaces(access_token)
      puts ss.inspect
      ss
    end

    def to_s
      Megam::Stuff.styled_hash(to_hash)  
    end

  end
end
