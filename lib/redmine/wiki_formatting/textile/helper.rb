#-- encoding: UTF-8
#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2013 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2013 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.rdoc for more details.
#++

module Redmine
  module WikiFormatting
    module Textile
      module Helper
        def wikitoolbar_for(field_id)
          heads_for_wiki_formatter
          url = url_for(:controller => '/help', :action => 'wiki_syntax')
          help_link = link_to(l(:setting_text_formatting), url,
                              :onclick => "window.open(\"#{ url }\", \"\", \"resizable=yes, location=no, width=600, height=640, menubar=no, status=no, scrollbars=yes\"); return false;")

          javascript_tag("var wikiToolbar = new jsToolBar($('#{field_id}')); wikiToolbar.setHelpLink('#{escape_javascript help_link}'); wikiToolbar.draw();")
        end

        def initial_page_content(page)
          "h1. #{@page.pretty_title}"
        end

        def heads_for_wiki_formatter
          unless @heads_for_wiki_formatter_included
            content_for :header_tags do
              javascript_include_tag("jstoolbar/lang/jstoolbar-#{current_language.to_s.downcase}")
            end
            @heads_for_wiki_formatter_included = true
          end
        end
      end
    end
  end
end
