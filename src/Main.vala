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

public class Main {
	private static bool version = false;

	private const OptionEntry[] options = {
		{ "version", 0, 0, OptionArg.NONE, ref version, "Display Version Number", null },
		{ null }
	};

	/**
	 * Main method. Responsible for starting the {@code Application} class.
	 *
	 * @see Socratest.Application
	 * @return {@code int}
	 * @since 1.0.0
	 */
	public static int main (string [] args) {
		var options_context = new OptionContext (Socratest.Configs.Constants.PROGRAME_NAME +" "+ _("Options"));
		options_context.set_help_enabled (true);
		options_context.add_main_entries (options, null);

		try {
			options_context.parse (ref args);
		}
		catch (Error error) {}

		if (version) {
			print (Socratest.Configs.Constants.PROGRAME_NAME +" "+ Socratest.Configs.Constants.VERSION + "\r\n");
			return 0;
		}
		else {
			var app = new Socratest.Application ();
			app.run (args);
		}

		return 0;
	}
}
