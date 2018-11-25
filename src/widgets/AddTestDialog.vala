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
using Socratest.Configs;
using Socratest.Controllers;

namespace Socratest.Widgets {

    /**
     * The {@code AddTest} class is responsible for creating add_test dialog.
     *
     * @see Gtk.Dialog
     * @since 1.0.0
     */
	[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/add_test.ui")]
	public class AddTestDialog : Gtk.Dialog {

		[GtkChild]
		private Gtk.Label word_list_name_label;

		[GtkChild]
		private Gtk.Entry word_list_name_entry;

		[GtkChild]
		private Gtk.Label course_label;

		[GtkChild]
		private Gtk.Entry course_entry;

		[GtkChild]
		private Gtk.Label year_label;

		[GtkChild]
		private Gtk.Entry year_entry;

		[GtkChild]
		private Gtk.Label word_list_label;

		[GtkChild]
		private Gtk.TextView word_list_text_view;

		[GtkChild]
		private Gtk.TextBuffer wl_buffer;

		[GtkChild]
		private Gtk.Button add_button;

		[GtkChild]
		private Gtk.Button cancel_button;

		private ActionManager action_manager;
		private WordList[] word_lists;
		private int id;
		TestDB test_db;

		public AddTestDialog (Gtk.Window parent, ActionManager action_manager, int id) {
			this.set_transient_for (parent);
			this.action_manager = action_manager;
			// make the ui easily translatable
			this.word_list_name_label.set_label (_("Wordlist Name:"));
			this.word_list_name_entry.set_text (_("New Wordlist"));
			this.course_label.set_label (_("Course:"));
			this.course_entry.set_placeholder_text (_("German"));
			this.year_label.set_label (_("Year:"));
			this.word_list_label.set_label (_("Wordlist:"));
			this.wl_buffer.set_text (_("Word = Answer\nWord 2 = Answer 2"));
			this.add_button.set_label (_("Add"));
			this.cancel_button.set_label (_("Cancel"));

			add_button.set_sensitive (false);

			this.test_db = new TestDB ();
			this.word_lists = test_db.get_wordlists ();
			this.id = id;

			if (id != -1) { // -1 is passed to the function if there is not already a wordlist
				this.add_button.set_label (_("Edit"));

				foreach (var word_list in word_lists) {
					if (word_list.get_id () == id) {
						// if wordlist is found add info to the ui
						word_list_name_entry.set_text (word_list.get_name ());
						course_entry.set_text (word_list.get_course ());
						year_entry.set_text (word_list.get_year ().to_string ());

						wl_buffer.set_text (word_list.get_text ());
						break;
					}
				}

			}
		}

		[GtkCallback]
		private void add_button_clicked (Gtk.Button button) {

			string word_list_text = word_list_text_view.get_buffer ().text;
			int year = int.parse (year_entry.get_text ());
			string course = course_entry.get_text ();
			string name =  word_list_name_entry.get_text ();

			WordList new_word_list = new WordList (word_list_text, year, course, name, id);

			if (id == -1) { // if id equals -1, it means that it is a new wordlist.
				test_db.add_word_list (new_word_list);
				action_manager.do ("add word_list");
				this.close ();
				return;
			}

			test_db.edit_word_list (new_word_list);
			action_manager.do ("edit word_list");
			this.close ();
		}

		[GtkCallback]
		private void cancel_button_clicked (Gtk.Button button) {
			this.close ();
		}

		[GtkCallback]
		private void changed_entries () {
			if (word_list_name_entry.text != "" && course_entry.text != "" && year_entry.text != "") {
				add_button.set_sensitive (true);
			} else {
				add_button.set_sensitive (false);
			}
		}
	}
}
