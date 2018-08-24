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


	public TestDB () {
		string database_location;

		#if _WIN32
		// get the data W32 filelocations
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
					print ("Error: %s\n", e.message);
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
				print ("Error: %s\n", e.message);
			}
		}
		database_location = @"$appdata/socratest/test_database.db";
		bool database_exists = FileUtils.test (database_location, FileTest.EXISTS);

		string errmsg;

		int ec = Sqlite.Database.open (database_location, out db);
		if (ec != Sqlite.OK) {
			stderr.printf ("Can't open database: %d: %s\n", db.errcode (), db.errmsg ());
			Gtk.main_quit ();
		}

		if (!database_exists)
			init_db ();

		get_wordlists ();
	}


	private bool init_db () {
		Statement stmt;
		int rc = 0;
		string errmsg;

		string query = """
		CREATE TABLE WordList (
			id				INTEGER			PRIMARY KEY	AUTOINCREMENT,
			word_list_text 	TEXT								NOT NULL,
			name			TEXT								NOT NULL,
			course			TEXT								NOT NULL,
			year			INT									NOT NULL

		);
		""";

		rc = db.exec (query, null, out errmsg);
		if (rc != Sqlite.OK) {
			stderr.printf ("Error: %s\n", errmsg);
			return false;
		}

		return true;
	}

	public bool add_word_list (WordList word_list) {
		Statement stmt;
		int rc = 0;
		string errmsg;

		string word_list_text = word_list.get_text ();
		string name = word_list.get_name ();
		string course = word_list.get_course ();
		int year = word_list.get_year ();

		string query = @" INSERT INTO WordList (word_list_text, name, course, year) VALUES ('$word_list_text', '$name', '$course', $year);";

		rc = db.exec (query, null, out errmsg);
		if (rc != Sqlite.OK) {
			stderr.printf ("Error: %s\n", errmsg);
			return false;
		}

		return true;
	}

	public bool remove_word_list (int id) {
		Statement stmt;
		int rc = 0;
		string errmsg;

		string prepared_query_str = @"DELETE FROM WordList WHERE id=$id;";

		rc = db.exec (prepared_query_str, null, out errmsg);
		if (rc != Sqlite.OK) {
			stderr.printf ("Error: %s\n", errmsg);
			return false;
		}

		return true;
	}

	public WordList[] get_wordlists () {
		Sqlite.Statement stmt;
		int rc;
		ArrayList<WordList> all_wordlists = new ArrayList<WordList> ();

		const string prepared_query_str = "SELECT * FROM WordList;";

		rc = db.prepare_v2 (prepared_query_str, prepared_query_str.length, out stmt);
		if (rc != Sqlite.OK) {
			stderr.printf ("Error: %d: %s\n", db.errcode (), db.errmsg ());
			return null;
		}

		int cols = stmt.column_count ();
		while (stmt.step () == Sqlite.ROW) {

			string word_list_text = "";
			string name = "";
			string course = "";
			int year = 0;
			int id = 0;

			for (int i = 0; i < cols; i++) {
				int type_id = stmt.column_type (i);

				switch (stmt.column_name (i)) {
					case "word_list_text":
						word_list_text = stmt.column_text (i) ?? "";
						break;

					case "year":
						string val = stmt.column_text (i) ?? "";
						year = int.parse (val);
						break;

					case "course":
						course = stmt.column_text (i) ?? "";
						break;

					case "name":
						name = stmt.column_text (i) ?? "";
						break;

					case "id":
						string val = stmt.column_text (i) ?? "";
						id = int.parse (val);
						break;
				}
			}
			all_wordlists.add (new WordList (word_list_text, year, course, name, id));
		}
		return all_wordlists.to_array ();
	}

}
