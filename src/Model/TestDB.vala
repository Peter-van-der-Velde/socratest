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
using Gee;
using Sqlite;

public class TestDB {

	private Sqlite.Database db;
	private string database_location;

	public TestDB () {

		#if W32
		string appdata = GLib.Environment.get_variable ("APPDATA");

		#else
		// get and if needed create the unix $home data filelocations.
		string appdata = GLib.Environment.get_variable ("XDG_DATA_HOME");
		if (appdata == null) {
			appdata = GLib.Environment.get_variable ("HOME");
			appdata += "/.local/share";
			bool local_share_exists = FileUtils.test (appdata, FileTest.EXISTS);
			if (!local_share_exists) {
				try {
					File appdata_folder = File.new_for_path (appdata);
					appdata_folder.make_directory ();
				} catch (Error e) {
					stdout.printf("Error: %s\n", e.message);
				}
			}
		}
		#endif

		bool appdata_location_exists = FileUtils.test (@"$appdata/socratest", FileTest.EXISTS);
		if (!appdata_location_exists) {
			try {
				File appdata_folder = File.new_for_path (@"$appdata/socratest");
				appdata_folder.make_directory ();
			} catch (Error e) {
				stdout.printf("Error: %s\n", e.message);
			}
		}
		database_location = @"$appdata/socratest/test_database.db";

		string errmsg;

		int ec = Sqlite.Database.open (database_location, out db);
		if (ec != Sqlite.OK) {
			stderr.printf ("Can't open database: %d: %s\n", db.errcode (), db.errmsg ());
			Gtk.main_quit ();
		}

	}

	public Test[] get_all_tests () {
		Test[] all_tests = new Test[0];

		return all_tests;
	}

}
