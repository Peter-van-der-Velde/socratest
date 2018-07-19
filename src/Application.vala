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
using Socratest.Controllers;

namespace Socratest {

	/**
	 * The {@code Application} class is a foundation for all GTK-based applications.
	 *
	 * @see Granite.Application
	 * @since 1.0.0
	 */
	public class Application : Granite.Application {

		public AppController controller;
		public ActionManager action_manager;

		/**
		 * Constructs a new {@code Application} object.
		 */
		public Application () {
			Object (
				application_id: Constants.ID,
				flags: ApplicationFlags.FLAGS_NONE
			);

			var quit_action = new SimpleAction ("quit", null);
			quit_action.activate.connect (() => {
				controller.quit ();
			});

			add_action (quit_action);
			add_accelerator ("<Control>q", "app.quit", null);
		}

		/**
		 * Handle attempts to start up the application
		 * @return {@code void}
		 */
		public override void activate () {
			if (controller == null) {
				controller = new AppController (this);
			}
			if (action_manager == null) {
				action_manager = new ActionManager (this);
			}

			controller.activate ();
		}
	}
}
