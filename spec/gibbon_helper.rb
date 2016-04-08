require 'spec_helper'

def hash_it string
  Digest::MD5.hexdigest string
end

def lists
   g = Gibbon::Request.new
   g.lists(Rails.application.secrets.list_id)
end

def purge_member user
  lists.members(hash_it user.email).delete
end

def purge_members
  members.each { |m| purge_member m }
end

def members
  lists.members.retrieve(params: {"fields": "members.email_address"})['members']
end
