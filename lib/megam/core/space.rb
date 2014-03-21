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
    def initialize()
      @id = nil
      @name = nil
      @description = nil
      @project = nil
      @wiki_name = nil
      @public_permissions = nil
      @team_permissions = nil
      @watcher_permissions = nil
      @share_permissions = nil
      @team_tab_role = nil
      @created_at = nil
      @updated_at = nil
      @default_showpage = nil
      @tabs_order = nil
      @parent_id = nil
      @restricted = nil
      @restricted_date = nil
      @commercial_from = nil
      @banner = nil
      @banner_height = nil
      @banner_text = nil
      @banner_link = nil
      @style = nil
      @status = nil
      @approved = nil
      @is_manager = nil
      @is_volunteer = nil
      @is_commercial = nil
      @can_join = nil
      @can_apply = nil
      @last_payer_changed_at = nil
    end

    def megam_rest
      Megam::Assembla.new
    end

    def space
      self
    end

    def id(arg=nil)
      if arg != nil
        @id = arg
      else
      @id
      end
    end

    def name(arg=nil)
      if arg != nil
        @name = arg
      else
      @name
      end
    end

    def description(arg=nil)
      if arg != nil
        @description = arg
      else
      @description
      end
    end

    def project(arg=nil)
      if arg != nil
        @project = arg
      else
      @project
      end
    end

    def wiki_name(arg=nil)
      if arg != nil
        @wiki_name = arg
      else
      @wiki_name
      end
    end

    def public_permissions(arg=nil)
      if arg != nil
        @public_permissions = arg
      else
      @public_permissions
      end
    end

    def team_permissions(arg=nil)
      if arg != nil
        @team_permissions = arg
      else
      @team_permissions
      end
    end

    def watcher_permissions(arg=nil)
      if arg != nil
        @watcher_permissions = arg
      else
      @watcher_permissions
      end
    end

    def share_permissions(arg=nil)
      if arg != nil
        @share_permissions = arg
      else
      @share_permissions
      end
    end

    def team_tab_role(arg=nil)
      if arg != nil
        @team_tab_role = arg
      else
      @team_tab_role
      end
    end

    def created_at(arg=nil)
      if arg != nil
        @created_at = arg
      else
      @created_at
      end
    end

    def updated_at(arg=nil)
      if arg != nil
        @updated_at = arg
      else
      @updated_at
      end
    end

    def default_showpage(arg=nil)
      if arg != nil
        @default_showpage = arg
      else
      @default_showpage
      end
    end

    def tabs_order(arg=nil)
      if arg != nil
        @tabs_order = arg
      else
      @tabs_order
      end
    end

    def parent_id(arg=nil)
      if arg != nil
        @parent_id = arg
      else
      @parent_id
      end
    end

    def restricted(arg=nil)
      if arg != nil
        @restricted = arg
      else
      @restricted
      end
    end

    def restricted_date(arg=nil)
      if arg != nil
        @restricted_date = arg
      else
      @restricted_date
      end
    end

    def commercial_from(arg=nil)
      if arg != nil
        @commercial_from = arg
      else
      @commercial_from
      end
    end

    def banner(arg=nil)
      if arg != nil
        @banner = arg
      else
      @banner
      end
    end

    def banner_height(arg=nil)
      if arg != nil
        @banner_height = arg
      else
      @banner_height
      end
    end

    def banner_link(arg=nil)
      if arg != nil
        @banner_link = arg
      else
      @banner_link
      end
    end

    def banner_text(arg=nil)
      if arg != nil
        @banner_text = arg
      else
      @banner_text
      end
    end

    def style(arg=nil)
      if arg != nil
        @style = arg
      else
      @style
      end
    end

    def status(arg=nil)
      if arg != nil
        @status = arg
      else
      @status
      end
    end

    def approved(arg=nil)
      if arg != nil
        @approved = arg
      else
      @approved
      end
    end

    def is_manager(arg=nil)
      if arg != nil
        @is_manager = arg
      else
      @is_manager
      end
    end

    def is_volunteer(arg=nil)
      if arg != nil
        @is_volunteer = arg
      else
      @is_volunteer
      end
    end

    def is_commercial(arg=nil)
      if arg != nil
        @is_commercial = arg
      else
      @is_commercial
      end
    end

    def can_join(arg=nil)
      if arg != nil
        @can_join = arg
      else
      @can_join
      end
    end

    def can_apply(arg=nil)
      if arg != nil
        @can_apply = arg
      else
      @can_apply
      end
    end

    def last_payer_changed_at(arg=nil)
      if arg != nil
        @last_payer_changed_at = arg
      else
      @last_payer_changed_at
      end
    end

    def some_msg(arg=nil)
      if arg != nil
        @some_msg = arg
      else
      @some_msg
      end
    end

    def error?
      crocked  = true if (some_msg.has_key?(:msg_type) && some_msg[:msg_type] == "error")
    end

    # Transform the ruby obj ->  to a Hash
    def to_hash
      index_hash = Hash.new
      index_hash["json_claz"] = self.class.name

      index_hash["id"] = id
      index_hash["name"] = name
      index_hash["description"] = description
      index_hash["project"] = project
      index_hash["wiki_name"] = wiki_name
      index_hash["public_permissions"] = public_permissions
      index_hash["team_permissions"] = team_permissions
      index_hash["watcher_permissions"] = watcher_permissions
      index_hash["share_permissions"] = share_permissions
      index_hash["team_tab_role"] = team_tab_role
      index_hash["created_at"] = created_at
      index_hash["updated_at"] = updated_at
      index_hash["default_showpage"] = default_showpage
      index_hash["tabs_order"] = tabs_order
      index_hash["parent_id"] = parent_id
      index_hash["restricted"] = restricted
      index_hash["restricted_date"] = restricted_date
      index_hash["commercial_from"] = commercial_from
      index_hash["banner"] = banner
      index_hash["banner_height"] = banner_height
      index_hash["banner_text"] = banner_text
      index_hash["banner_link"] = banner_link
      index_hash["style"] = style
      index_hash["status"] = status
      index_hash["approved"] = approved
      index_hash["is_manager"] = is_manager
      index_hash["is_volunteer"] = is_volunteer
      index_hash["is_commercial"] = is_commercial
      index_hash["can_join"] = can_join
      index_hash["can_apply"] = can_apply
      index_hash["last_payer_changed_at"] = last_payer_changed_at
      index_hash
    end

    # Serialize this object as a hash: called from JsonCompat.
    # Verify if this called from JsonCompat during testing.
    def to_json(*a)
      for_json.to_json(*a)
    end

    def for_json
      result = {
        "id" => id,
        "name" => name,
        "description" => description,
        "project" => project,
        "wiki_name" => wiki_name,
        "public_permissions" => public_permissions,
        "team_permissions" => team_permissions,
        "watcher_permissions" => watcher_permissions,
        "share_permissions" => share_permissions,
        "team_tab_role" => team_tab_role,
        "created_at" => created_at,
        "updated_at" => updated_at,
        "default_showpage" => default_showpage,
        "tabs_order" => tabs_order,
        "parent_id" => parent_id,
        "restricted" => restricted,
        "restricted_date" => restricted_date,
        "commercial_from" => commercial_from,
        "banner" => banner,
        "banner_height" => banner_height,
        "banner_text" => banner_text,
        "banner_link" => banner_link,
        "style" => style,
        "status" => status,
        "approved" => approved,
        "is_manager" => is_manager,
        "is_volunteer" => is_volunteer,
        "is_commercial" => is_commercial,
        "can_join" => can_join,
        "can_apply" => can_apply,
        "last_payer_changed_at" => last_payer_changed_at
      }
      result
    end

    def self.json_create(o)
      space = new
      space.id(o["id"]) if o.has_key?("id")
      space.name(o["name"]) if o.has_key?("name")
      space.description(o["description"]) if o.has_key?("description")
      space.project(o["project"]) if o.has_key?("project")
      space.wiki_name(o["wiki_name"]) if o.has_key?("wiki_name")
      space.public_permissions(o["public_permissions"]) if o.has_key?("public_permissions")
      space.team_permissions(o["team_permissions"]) if o.has_key?("team_permissions")
      space.watcher_permissions(o["watcher_permissions"]) if o.has_key?("watcher_permissions")
      space.share_permissions(o["share_permissions"]) if o.has_key?("share_permissions")
      space.team_tab_role(o["team_tab_role"]) if o.has_key?("team_tab_role")
      space.created_at(o["created_at"]) if o.has_key?("created_at")
      space.updated_at(o["updated_at"]) if o.has_key?("updated_at")
      space.default_showpage(o["default_showpage"]) if o.has_key?("default_showpage")
      space.tabs_order(o["tabs_order"]) if o.has_key?("tabs_order")
      space.parent_id(o["parent_id"]) if o.has_key?("parent_id")
      space.restricted(o["restricted"]) if o.has_key?("restricted")
      space.restricted_date(o["restricted_date"]) if o.has_key?("restricted_date")
      space.commercial_from(o["commercial_from"]) if o.has_key?("commercial_from")
      space.banner(o["banner"]) if o.has_key?("banner")
      space.banner_height(o["banner_height"]) if o.has_key?("banner_height")
      space.banner_text(o["banner_text"]) if o.has_key?("banner_text")
      space.banner_link(o["banner_link"]) if o.has_key?("banner_link")
      space.style(o["style"]) if o.has_key?("style")
      space.status(o["status"]) if o.has_key?("status")
      space.approved(o["approved"]) if o.has_key?("approved")
      space.is_manager(o["is_manager"]) if o.has_key?("is_manager")
      space.is_volunteer(o["is_volunteer"]) if o.has_key?("is_volunteer")
      space.is_commercial(o["is_commercial"]) if o.has_key?("is_commercial")
      space.can_join(o["can_join"]) if o.has_key?("can_join")
      space.can_apply(o["can_apply"]) if o.has_key?("can_apply")
      space.last_payer_changed_at(o["last_payer_changed_at"]) if o.has_key?("last_payer_changed_at")

      #success or error
      space.some_msg[:code] = o["code"] if o.has_key?("code")
      space.some_msg[:msg_type] = o["msg_type"] if o.has_key?("msg_type")
      space.some_msg[:msg]= o["msg"] if o.has_key?("msg")
      space.some_msg[:links] = o["links"] if o.has_key?("links")

      space
    end

    def self.from_hash(o)
      space = self.new
      space.from_hash(o)
      space
    end

    def from_hash(o)
      @id        = o["id"] if o.has_key?("id")
      @name    = o["name"] if o.has_key?("name")
      @description    = o["description"] if o.has_key?("description")
      @project    = o["project"] if o.has_key?("project")
      @wiki_name   = o["wiki_name"] if o.has_key?("wiki_name")
      @public_permissions   = o["public_permissions"] if o.has_key?("public_permissions")
      @team_permissions   = o["team_permissions"] if o.has_key?("team_permissions")
      @watcher_permissions   = o["watcher_permissions"] if o.has_key?("watcher_permissions")
      @share_permissions   = o["share_permissions"] if o.has_key?("share_permissions")
      @team_tab_role   = o["team_tab_role"] if o.has_key?("team_tab_role")
      @created_at        = o["created_at"] if o.has_key?("created_at")
      @updated_at       = o["updated_at"] if o.has_key?("updated_at")
      @default_showpage   = o["default_showpage"] if o.has_key?("default_showpage")
      @tabs_order    = o["tabs_order"] if o.has_key?("tabs_order")
      @parent_id    = o["parent_id"] if o.has_key?("parent_id")
      @restricted   = o["restricted"] if o.has_key?("restricted")
      @restricted_date   = o["restricted_date"] if o.has_key?("restricted_date")
      @commercial_from   = o["commercial_from"] if o.has_key?("commercial_from")
      @banner   = o["banner"] if o.has_key?("banner")
      @banner_height   = o["banner_height"] if o.has_key?("banner_height")
      @banner_text  = o["banner_text"] if o.has_key?("banner_text")
      @banner_link        = o["banner_link"] if o.has_key?("banner_link")
      @style       = o["style"] if o.has_key?("style")
      @status   = o["status"] if o.has_key?("status")
      @approved    = o["approved"] if o.has_key?("approved")
      @is_manager   = o["is_manager"] if o.has_key?("is_manager")
      @is_volunteer   = o["is_volunteer"] if o.has_key?("is_volunteer")
      @is_commercial   = o["is_commercial"] if o.has_key?("is_commercial")
      @can_join   = o["can_join"] if o.has_key?("can_join")
      @can_apply   = o["can_apply"] if o.has_key?("can_apply")
      @last_payer_changed_at   = o["last_payer_changed_at"] if o.has_key?("last_payer_changed_at")
      self
    end

    def self.create()
      acct = from_hash()
      acct.create
    end
   
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
