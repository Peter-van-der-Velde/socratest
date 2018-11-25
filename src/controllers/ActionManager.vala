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

using Socratest.Widgets;
using Socratest.Views;

namespace Socratest.Controllers {

	/**
	 * The {@code ActionManager} class.
	 *
	 * @since 1.0.0
	 */
	public class ActionManager {

		private AppController 				app_controller;
		private weak Socratest.Application  application;
		private weak Gtk.ApplicationWindow  window { get; private set; default = null; }
		Gee.LinkedList<string>				actions;

		/**
		 * Constructs a new {@code ActionManager} object.
		 */
		public ActionManager (AppController app_controller) {
			this.app_controller = app_controller;
			this.actions = new Gee.LinkedList<string> ();
		}

		public void activate () {
		}

		public void do (string action) {
			switch (action)
			{
				case "add word_list":
					app_controller.home_view.update_test_list ();
					if (app_controller.main_stack.get_visible_child_name () == "Welcome View") {
						app_controller.main_stack.set_visible_child_name ("Home View");
					}
					app_controller.word_lists = app_controller.test_db.get_wordlists ();
					break;
				case "edit word_list":
					app_controller.home_view.update_test_list ();
					app_controller.word_lists = app_controller.test_db.get_wordlists ();
					break;
				default:
					print ("[ERROR] Unknown action: %s", action);
					break;
			}
			// add action to actions list
			actions.offer_tail (action);
			return;
		}

		public void undo () {

			if (actions.size == 0)
				return;

			string action = actions.poll_tail ();
			switch (action)
			{
				case "add wordlist":
					break;
				case "edit word_list":
					break;
				default:
					print ("[ERROR] Unknown action: %s", action);
					break;
			}
			return;
		}

		public void pressed_play (int id) {
			app_controller.current_wordlist_id = id;
			app_controller.main_stack.set_visible_child_name ("TestSettings View");
		}

		public void set_test_settings () {

		}

		public WordList get_current_wordlist () {
			foreach (WordList word_list in app_controller.word_lists) {
				if (word_list.get_id () == app_controller.current_wordlist_id) {
					return word_list;
				}
			}
			return null;
		}

		public void init_test_view () {
			app_controller.test_view.init ();
		}

		public void generate_results (Test test) {
			app_controller.main_stack.set_visible_child_name ("TestResults View");
			app_controller.test_results.init (test);

			return;
		}
	}
}
