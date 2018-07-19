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

		private weak Socratest.Application        application;
		private weak Gtk.ApplicationWindow  window { get; private set; default = null; }
		private weak TestDB 				test_db;
		Gee.List<string>					actions;

		/**
		 * Constructs a new {@code ActionManager} object.
		 */
		public ActionManager (Socratest.Application application) {
			this.application = application;
			this.window = application.controller.window;
			this.actions = new Gee.ArrayList<string> ();
		}

		public void activate () {
		}

		public void do (string action) {
			switch (action)
			{
				case "add wordlist":
					this.application.controller.home_view.update_test_list ();
					break;
			}
			return;
		}

		public void undo () {

			if (actions.size == 0)
				return;


			return;
		}
	}
}
