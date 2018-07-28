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

using Socratest.Configs;
using Socratest.Widgets;
using Socratest.Controllers;

namespace Socratest.Views {


	/**
	 * The {@code Welcome} class.
	 *
	 * @since 1.0.0
	 */
	public class Welcome : Gtk.Box {

		/**
		 * Constructs a new {@code Welcome} object.
		 */
		public Welcome (Gtk.Window parent, ActionManager action_manager) {
			var welcome_view = new Granite.Widgets.Welcome (_("Welcome to Socratest"), _("It seems that there aren't any wordlists yet."));
			welcome_view.append ("document-new", _("New Wordlist"), _("Create a new wordlist."));

			welcome_view.activated.connect ((index) => {
				try {
					AddTestDialog add_test_dialog = new AddTestDialog (parent, action_manager);
					add_test_dialog.show_all ();
				} catch (Error e) {
					warning (e.message);
				}
			});

			this.add (welcome_view);
		}
	}
}
