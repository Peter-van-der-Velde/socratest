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
using Socratest.Widgets;
using Socratest.Controllers;

namespace Socratest.Views {


	/**
	 * The {@code Home} class.
	 *
	 * @since 1.0.0
	 */

	[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/home.ui")]
	public class Home : Gtk.Box {

		private Gtk.Window parent;
		private ActionManager action_manager;
		private Stack main_stack;
		private string search_entry_text;
		private WordList[] word_lists;
		private TestDB test_db;

		[GtkChild]
		private Gtk.ListStore test_list_store;

		[GtkChild]
		private TreeView test_tree;

		[GtkChild]
		private TreeSelection selected_row;

		public Home (Gtk.Window parent, Gtk.Stack main_stack, ActionManager action_manager) {
			this.parent = parent;
			this.main_stack = main_stack;
			this.action_manager = action_manager;
			search_entry_text = "";

			this.test_db = new TestDB ();
			this.word_lists = test_db.get_wordlists ();
			print ("[DBG] Amount of wordlists: %d\n", word_lists.length);
			update_test_list ();
		}

		[GtkCallback]
		private void search_entry_changed (Editable search_entry) {
			search_entry_text = ((SearchEntry) search_entry).get_text ();
			print ("wrote \"%s\" in the search entry\n", search_entry_text);
		}

		[GtkCallback]
		private void play_button_clicked (Button button) {
			Gtk.TreeIter iter;
			Gtk.TreeModel model;
			// only if you actually selected a row you can remove it
			if (selected_row.get_selected(out model, out iter)) {
				int id;
				string course;
				string name;
				int year;

				model.get (iter, 0, out id, 1, out course, 2, out name, 3, out year);
				action_manager.pressed_play (id);
    		}
		}

		[GtkCallback]
		private void add_button_clicked (Button button) {
			int id = 1; // -1 means it doesn't have a valid id, and is thus non existing
			AddTestDialog add_test_dialog = new AddTestDialog (parent, action_manager, id);
			add_test_dialog.show_all ();
		}

		[GtkCallback]
		private void edit_button_clicked (Button button) {
			Gtk.TreeIter iter;
			Gtk.TreeModel model;
			// only if you actually selected a row you can remove it
			if (selected_row.get_selected(out model, out iter)) {
				int id;
				string course;
				string name;
				int year;

				model.get (iter, 0, out id, 1, out course, 2, out name, 3, out year);
       			print ("edit id:%d c:%s n:%s y:%d...\n", id, course, name, year);
       			AddTestDialog add_test_dialog = new AddTestDialog (parent, action_manager, id);
				add_test_dialog.show_all ();
    		}
		}

		[GtkCallback]
		private void remove_button_clicked (Button button) {
			Gtk.TreeIter iter;
			Gtk.TreeModel model;
			// only if you actually selected a row you can remove it
			if (selected_row.get_selected(out model, out iter)) {
				int id;
				string course;
				string name;
				int year;

				model.get (iter, 0, out id, 1, out course, 2, out name, 3, out year);
       			print ("removing id:%d c:%s n:%s y:%d...\n", id, course, name, year);
       			test_db.remove_word_list (id);
       			update_test_list ();
    		}
		}

		public void update_test_list () {
			this.test_db = new TestDB ();
			this.word_lists = test_db.get_wordlists ();
			print ("[DBG] Amount of wordlists: %d\n", word_lists.length);

			test_list_store.clear ();
			Gtk.TreeIter iter;
 			foreach (WordList word_list in word_lists) {
				test_list_store.append (out iter);
				test_list_store.set (iter, 0, word_list.get_id (), 1, word_list.get_course (), 2, word_list.get_name (), 3, word_list.get_year ());
			}
		}
	}
}

