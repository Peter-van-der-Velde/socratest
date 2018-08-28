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
using Socratest.Controllers;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/test.ui")]
public class Socratest.TestView : Gtk.Box {

	[GtkChild]
	private Label cw_label;

	[GtkChild]
	private Label current_word;

	[GtkChild]
	private Entry current_anwser;

	[GtkChild]
	private Label feedback;

	[GtkChild]
	private Label current_word_of;

	[GtkChild]
	private Button next_button;

	private Test test;
	private Stack main_stack;
	private ActionManager action_manager;

	public TestView (Stack main_stack, ActionManager action_manager) {
		this.main_stack = main_stack;
		this.action_manager = action_manager;

		cw_label.set_text (_("Current Word:"));
		feedback.set_text ("");
		next_button.set_label (_("Next"));
	}

	[GtkCallback]
	void next_button_clicked (Button button) {
		string anwser = current_anwser.get_text ();

		feedback.label = "";


		this.cw_label.label = test.get_current_word ();
		int index = test.get_index () + 1;
		int length = test.get_length ();
		this.current_word_of.label =  @"$index / $length";
		return;
	}

	public void init () {
		feedback.label = ""; // clean the feedback label

		// get the selected wordlist information
		WordList wl = action_manager.get_current_wordlist ();

		//init the new test
		var settings = Socratest.Configs.Settings.get_instance ();
		this.test = new Test (wl.get_text (), wl.get_name (), wl.get_year (), wl.get_course (), settings.type_of_test, settings.test_word_order, wl.get_id ());

		// TODO:
		// set the ui to the first values of the test
		this.cw_label.label = test.get_current_word ();
		int index = test.get_index () + 1;
		int length = test.get_length ();
		this.current_word_of.label =  @"$index / $length";
	}


}
