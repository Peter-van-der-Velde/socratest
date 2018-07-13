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

		private Gtk.Application            	application;
		private AppView                    	app_view;
		private Home 						home_view;
		private TestView 					test_view;
		private TestResults 				test_results;
		private TestSettings 				test_settings;
		private AddTest 					add_test;
		private Gtk.HeaderBar              	headerbar;
		private Gtk.ApplicationWindow      	window { get; private set; default = null; }
		private Gtk.Stack					main_stack;
		private TestDB 						test_db;
		private WordList[] 					word_lists;

		/**
		 * Constructs a new {@code AppController} object.
		 */
		public AppController (Gtk.Application application) {
			this.application = application;
			this.window = new Window (this.application);
			this.headerbar = new HeaderBar ();
			this.main_stack = new Gtk.Stack ();
			this.app_view = new AppView ();

			this.home_view = new Socratest.Home (main_stack, test_db, ref word_lists);
			this.test_view = new Socratest.TestView (main_stack);
			this.test_results = new Socratest.TestResults (main_stack);
			this.test_settings = new Socratest.TestSettings (main_stack);
			this.add_test = new Socratest.AddTest (main_stack);

			this.main_stack.add_named (app_view, "App View");
			this.main_stack.add_named (home_view, "Home View");
			this.main_stack.add_named (test_view, "Test View");
			this.main_stack.add_named (test_results, "TestResults View");
			this.main_stack.add_named (test_settings, "TestSettings View");
			this.main_stack.add_named (add_test, "AddTest View");

			this.window.add (this.main_stack);
			this.window.set_default_size (800, 640);
			this.window.set_size_request (800, 640);
			this.window.set_titlebar (this.headerbar);
			this.application.add_window (window);
		}

		public void activate () {
			window.show_all ();
			app_view.activate ();
		}

		public void quit () {
			window.destroy ();
		}
	}
}