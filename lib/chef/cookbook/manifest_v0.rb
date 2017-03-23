# Author:: Daniel DeLeo (<dan@chef.io>)
# Copyright:: Copyright 2015-2016, Chef Software Inc.
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

require "chef/json_compat"
require "chef/mixin/versioned_api"

class Chef
  class Cookbook
    class ManifestV0
      extend Chef::Mixin::VersionedAPI

      minimum_api_version 0

      COOKBOOK_SEGMENTS = [ :resources, :providers, :recipes, :definitions, :libraries, :attributes, :files, :templates, :root_files ]

      def self.from_hash(hash)
        response = Mash.new
        response[:all_files] = COOKBOOK_SEGMENTS.inject([]) do |memo, segment|
          next memo if hash[segment].nil? || hash[segment].empty?
          hash[segment].each do |file|
            memo << file
            memo
          end
        end
        response
      end

    end
  end
end
