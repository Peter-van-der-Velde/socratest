/*
* Copyright (c) 2018 Peter van der Velde (https://vandervelde.cc)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Peter van der Velde <petervandervelde2@gmail.com>
*/
using Gtk;

namespace LibreLehrer {
	// public LibreLehrer.Services.Settings settings;
	public const string APP_NAME = "Libre Lehrer";
	public const string TERMINAL_NAME = "libre_lehrer";
}

public class LibreLehrer.Application : Granite.Application {

	public Application () {
		Object (
			application_id: "com.gitlab.Peter_van_der_Velde.libre_lehrer",
			flags: ApplicationFlags.FLAGS_NONE
		);

		app_launcher = "com.gitlab.Peter_van_der_Velde.libre_lehrer.desktop";
		program_name = "Libre Lehrer";
		exec_name = "com.gitlab.Peter_van_der_Velde.libre_lehrer";
	}

	protected override void activate () {
		var window = new LibreLehrer.Window ();
		this.add_window (window);
		window.show_all ();
	}

	static int main (string args[]) {

		Environment.set_application_name (APP_NAME);
		Environment.set_prgname (APP_NAME);

		var application = new LibreLehrer.Application ();

		return application.run (args);
	}

}


