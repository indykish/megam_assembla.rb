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
  class SpaceCollection
    include Enumerable

    
    attr_reader :iterator
    def initialize
      @spaces = Array.new
      @spaces_by_name = Hash.new
      @insert_after_idx = nil
    end

    def all_spaces
      @spaces
    end

    def [](index)
      @spaces[index]
    end

    def []=(index, arg)
      is_megam_space(arg)
      @spaces[index] = arg
      @spaces_by_name[arg.wiki_name] = index
    end

    def <<(*args)
      args.flatten.each do |a|
        is_megam_space(a)
        @spaces << a
        @spaces_by_name[a.wiki_name] = @spaces.length - 1
      end
      self
    end

    # 'push' is an alias method to <<
    alias_method :push, :<<

    def insert(space)
      is_megam_space(space)
      if @insert_after_idx
        # in the middle of executing a run, so any spaces inserted now should
        # be placed after the most recent addition done by the currently executing
        # space
        @spaces.insert(@insert_after_idx + 1, space)
        # update name -> location mappings and register new space
        @spaces_by_name.each_key do |key|
        @spaces_by_name[key] += 1 if @spaces_by_name[key] > @insert_after_idx
        end
        @spaces_by_name[space.wiki_name] = @insert_after_idx + 1
        @insert_after_idx += 1
      else
      @spaces << space
      @spaces_by_name[space.wiki_name] = @spaces.length - 1 
      end
    end

    def each
      @spaces.each do |space|
        yield space
      end
    end

    def each_index
      @spaces.each_index do |i|
        yield i
      end
    end

    def empty?
      @spaces.empty?
    end

    def lookup(space)
      lookup_by = nil
      if space.kind_of?(Megam::Space)
      lookup_by = space.wiki_name
      elsif space.kind_of?(String)
      lookup_by = space
      else
        raise ArgumentError, "Must pass a Megam::Space or String to lookup"
      end
      res = @spaces_by_name[lookup_by]
      unless res
        raise ArgumentError, "Cannot find a space matching #{lookup_by} (did you define it first?)"
      end
      @spaces[res]
    end
    
     # Transform the ruby obj ->  to a Hash
    def to_hash
      index_hash = Hash.new
      self.each do |space|
        index_hash[space.wiki_name] = space.to_s
      end
      index_hash
    end

    # Serialize this object as a hash: called from JsonCompat.
    # Verify if this called from JsonCompat during testing.
    def to_json(*a)
      for_json.to_json(*a)
    end

    def self.json_create(o)
      collection = self.new()
      o["results"].each do |spaces_list|
        spaces_array = spaces_list.kind_of?(Array) ? spaces_list : [ spaces_list ]
        spaces_array.each do |space|
          collection.insert(space)
        end
      end
      collection
    end

    private

    
    
    def is_megam_space(arg)
      unless arg.kind_of?(Megam::Space)
        raise ArgumentError, "Members must be Megam::Space's"
      end
      true
    end

    def to_s
      Megam::Stuff.styled_hash(to_hash)
    end

  end
end
