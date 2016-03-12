#
# Cookbook Name:: google-chrome
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

apt_repository 'google-chrome' do
  uri          node['chrome']['apt_uri']
  key          node['chrome']['apt_key']
  arch         'amd64'
  distribution 'stable'
  components   %w(main)
  action :nothing
end.run_action(:add)

package "google-chrome-#{node['chrome']['track']}" do
  action :nothing
end.run_action(:install)
