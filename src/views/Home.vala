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

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/home.ui")]
public class Socratest.Home : Gtk.Box {

	private string search_entry_text;
	private Stack main_stack;
	private WordList[] word_lists;

	[GtkChild]
	private Gtk.ListStore test_list_store;

	[GtkChild]
	private TreeView test_tree;

	public Home (Stack main_stack, TestDB test_db, ref WordList[] word_lists) {
		this.main_stack = main_stack;
		search_entry_text = "";

        this.word_lists = word_lists;
        update_test_list ();
	}

	[GtkCallback]
	private void search_entry_changed (Editable search_entry) {
		search_entry_text = ((SearchEntry)search_entry).get_text ();
		stdout.printf ("wrote \"%s\" in the search entry\n", search_entry_text);
	}

	[GtkCallback]
	private void play_button_clicked (Button button) {
		stdout.printf ("clicked on the play button\n");
		main_stack.set_visible_child_name ("TestSettings View");
	}

	[GtkCallback]
	private void add_button_clicked (Button button) {
		stdout.printf ("clicked on the add button\n");
		main_stack.set_visible_child_name ("AddTest View");

		// test code
		int id = 0;
		Gtk.TreeIter iter;
        test_list_store.append (out iter);
        test_list_store.set (iter, 0, id, 1,"English", 2, "test", 3, 2);
	}

	[GtkCallback]
	private void edit_button_clicked (Button button) {
		stdout.printf ("clicked on the edit button\n");
	}

	[GtkCallback]
	private void remove_button_clicked (Button button) {
		stdout.printf ("clicked on the remove button\n");
	}

	private void update_test_list () {
		Gtk.ListStore new_test_list_store = test_list_store;

		new_test_list_store.clear ();
		Gtk.TreeIter iter;
        test_list_store.append (out iter);
        foreach (WordList word_list in word_lists) {
        	test_list_store.set (iter, 0, word_list.get_id (), 1, word_list.get_course (), 2, word_list.get_name (), 3, word_list.get_year ());
        }
        test_list_store = new_test_list_store;
	}
}
