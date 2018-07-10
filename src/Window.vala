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

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/main.ui")]
public class Socratest.Window : Gtk.Window {

	private string search_entry_text;
	private Socratest.Home home_view;
	private Socratest.TestView test_view;
	private Socratest.TestResults test_results;
	private Socratest.TestSettings test_settings;
	private Socratest.AddTest add_test;

	[GtkChild]
	private Button hd_home;

	[GtkChild]
	private Stack main_stack;

	public Window () {
		this.set_default_size (600,300);
		search_entry_text = "";
		TestDB test_db = new TestDB ();

		home_view = new Socratest.Home (main_stack);
		test_view = new Socratest.TestView (main_stack);
		test_results = new Socratest.TestResults (main_stack);
		test_settings = new Socratest.TestSettings (main_stack);
		add_test = new Socratest.AddTest (main_stack);

		main_stack.add_named (home_view, "Home View");
		main_stack.add_named (test_view, "Test View");
		main_stack.add_named (test_results, "TestResults View");
		main_stack.add_named (test_settings, "TestSettings View");
		main_stack.add_named (add_test, "AddTest View");

		hd_home.clicked.connect (() => {
				main_stack.set_visible_child_name ("Home View");
		});
	}
}
