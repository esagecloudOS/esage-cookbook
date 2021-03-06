# Copyright 2014, Abiquo
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

require "#{ENV['BUSSER_ROOT']}/../kitchen/data/serverspec_helper"

describe 'Front-end packages' do
  include_examples 'common::packages'
  include_examples 'frontend::packages'

  it 'does not have other abiquo installed' do
    %w(server remote-services monolithic v2v).each do |pkg|
      expect(package("abiquo-#{pkg}")).to_not be_installed
    end
  end
end
