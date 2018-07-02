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

public class MyApp : Gtk.Application {

	public MyApp () {
		Object (
			application_id: "com.gitlab.Peter_van_der_Velde.libre_lehrer",
			flags: ApplicationFlags.FLAGS_NONE
		);
	}

	protected override void activate () {
		var main_window = new Gtk.ApplicationWindow (this);

		var grid = new Gtk.Grid ();
		grid.orientation = Gtk.Orientation.VERTICAL;
		grid.row_spacing = 6;

		var title_label = new Gtk.Label (_("Notifications"));
		var show_button = new Gtk.Button.with_label (_("Show"));

		grid.add (title_label);
		grid.add (show_button);

		show_button.clicked.connect (() => {
			var notification = new Notification (_("Hello World"));
			notification.set_body (_("This is my first notification!"));
			this.send_notification ("notify.app", notification);
		});

		main_window.add (grid);
		main_window.show_all ();

		main_window.default_height = 300;
		main_window.default_width = 300;
		main_window.title = "Hello World";
		main_window.show_all ();
	}

	public static int main (string[] args) {
		var app = new MyApp ();
		return app.run (args);
	}
}
