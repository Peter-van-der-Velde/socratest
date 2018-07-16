/*
* Copyright (C) 2018  Peter van der Velde <petervandervelde2@gmail.com>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/
using Gtk;
using Socratest.Configs;
using Socratest.Widgets;

namespace Socratest.Views {

    private string search_entry_text;
    private Stack main_stack;
    /**
     * The {@code AppView} class.
     *
     * @since 1.0.0
     */
    public class Welcome : Gtk.Box {

        /**
         * Constructs a new {@code AppView} object.
         */
        public Welcome (Stack main_stack, TestDB test_db) {
            var welcome_view = new Granite.Widgets.Welcome (_("Welcome"), _("Open up your editor to get started!"));
            welcome_view.append ("text-x-vala", _("Visit Valadoc"), _("The canonical source for Vala API references."));
            welcome_view.append ("distributor-logo", _("Visit elementary.io"), _("Read up on developing for elementary"));
            welcome_view.activated.connect ((index) => {
                switch (index) {
                    case 0:
                        try {
                            AppInfo.launch_default_for_uri ("https://valadoc.org/", null);
                        } catch (Error e) {
                            warning (e.message);
                        }

                        break;
                    case 1:
                        try {
                            AppInfo.launch_default_for_uri ("https://developer.elementary.io", null);
                        } catch (Error e) {
                            warning (e.message);
                        }

                        break;
                }
            });

            this.add (welcome_view);
        }
    }
}
