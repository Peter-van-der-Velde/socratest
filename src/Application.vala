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

// public class MyApp : Gtk.Application {

// 	public MyApp () {
// 		Object (
// 			application_id: "com.gitlab.Peter_van_der_Velde.libre_lehrer",
// 			flags: ApplicationFlags.FLAGS_NONE
// 		);
// 	}

// 	protected override void activate () {
// 		var main_window = new ValaGtk.Application();
// 		main_window.show_all ();
// 		main_window.destroy.connect(Gtk.main_quit);
// 		main_window.show_all ();
// 		Gtk.main ();
// 	}

// 	// public static int main (string[] args) {
// 	// 	var main_window = new ValaGtk.Application();
// 	// 	main_window.show_all ();
// 	// 	main_window.destroy.connect(Gtk.main_quit);
// 	// 	main_window.show_all ();
// 	// 	Gtk.main ();
// 	// 	return 0;
// 	// }
// }

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/libre_lehrer/main.ui")]
public class ValaGtk.Application : Gtk.Window {

	construct {
		print ("Hello World!\n");
	}
}
