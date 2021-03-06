# Copyright (c) 2013 Red Hat
#
# MIT License
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module Trebuchet
  module Operation
    class LargeSync < Trebuchet::Engine::KatelloCommand

      ORG_NAME = "SomeOrg"
      ENV_NAME = "DEV"

      def self.name
        "LargeSync"
      end

      def self.description
        "Peforms a content sync to Library using a large repository"
      end

      def katello_commands
        [
            { :id=> :org_create,
              :command => "org create --name=#{ORG_NAME}" },
            { :id=>:env_create,
              :command=>"environment create --org=ACME_Corporation --name=#{ORG_NAME} --prior=Library"},
            { :id=> :org_destroy,
              :command => "org delete --name=#{ORG_NAME}" }
        ]
      end
    end
  end
end
