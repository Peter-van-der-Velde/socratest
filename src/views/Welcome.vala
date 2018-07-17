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


	/**
	 * The {@code AppView} class.
	 *
	 * @since 1.0.0
	 */
	public class Welcome : Gtk.Box {

		private string search_entry_text;
		private Stack main_stack;
		/**
		 * Constructs a new {@code AppView} object.
		 */
		public Welcome (Gtk.Window parent, Gtk.Stack main_stack) {
			var welcome_view = new Granite.Widgets.Welcome (_("Welcome to Socratest"), _("It seems that there aren't any wordlists yet."));
			welcome_view.append ("document-new", _("New Wordlist"), _("Create a new wordlist."));

			this.main_stack = main_stack;

			welcome_view.activated.connect ((index) => {
				try {
					AddTestDialog add_test_dialog = new AddTestDialog (parent);
					add_test_dialog.show_all ();


					WordList[] word_lists;

					TestDB test_db = new TestDB ();
					word_lists = test_db.get_wordlists ();

					if (word_lists.length > 0) {
						this.main_stack.set_visible_child_name ("Home View");
						Home home = ((Home) main_stack.get_child_by_name ("Home View"));
					}
				} catch (Error e) {
					warning (e.message);
				}
			});

			this.add (welcome_view);
		}
	}
}
