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
	 * The {@code AppController} class.
	 *
	 * @since 1.0.0
	 */
	public class AppController {

		private Gtk.Application       		application;
		public ActionManager 				action_manager;

		private Welcome                    	welcome_view;
		public Home 						home_view { get; private set; default = null; }
		public TestView 					test_view;
		public TestResults 					test_results;
		private TestSettings 				test_settings;
		private Gtk.HeaderBar              	headerbar;
		public Gtk.ApplicationWindow      	window { get; private set; default = null; }
		public Gtk.Stack					main_stack { get; private set; default = null; }
		public TestDB 						test_db { get; private set; default = null; }
		public WordList[] 					word_lists;
		public int 							current_wordlist_id;

		/**
		 * Constructs a new {@code AppController} object.
		 */
		public AppController (Gtk.Application application) {
			this.application = application;
			this.action_manager = new ActionManager (this);

			this.window = new Window (this.application);
			this.headerbar = new HeaderBar ();
			this.main_stack = new Gtk.Stack ();
			this.test_db = new TestDB ();
			this.word_lists = test_db.get_wordlists ();

			this.welcome_view = new Welcome (this.window, this.action_manager);
			this.home_view = new Home (this.window, this.main_stack, this.action_manager);
			this.test_view = new TestView (this.main_stack, this.action_manager);
			this.test_results = new TestResults (this.main_stack);
			this.test_settings = new TestSettings (this.main_stack, this.action_manager);

			this.main_stack.add_named (home_view, "Home View");
			this.main_stack.add_named (test_view, "Test View");
			this.main_stack.add_named (test_results, "TestResults View");
			this.main_stack.add_named (test_settings, "TestSettings View");
			this.main_stack.add_named (welcome_view, "Welcome View");

			this.window.add (this.main_stack);
			this.window.set_default_size (800, 640);
			this.window.set_size_request (800, 640);
			this.window.set_titlebar (this.headerbar);
			this.application.add_window (window);
		}

		public void activate () {
			window.show_all ();

			// if there are already any wordlist show the home view instead of the welcome view
			if (word_lists.length > 0) {
				this.main_stack.set_visible_child_name ("Home View");
			} else {
				this.main_stack.set_visible_child_name ("Welcome View");
				welcome_view.activate ();
			}
		}

		public void quit () {
			window.destroy ();
		}

	}
}
