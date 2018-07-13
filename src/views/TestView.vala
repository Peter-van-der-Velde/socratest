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

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/test.ui")]
public class Socratest.TestView : Gtk.Box {

	private Stack main_stack;

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


	public TestView (Stack main_stack) {
		this.main_stack = main_stack;

		cw_label.set_text (_("Current Word:"));
		feedback.set_text ("");
		next_button.set_label (_("Next"));
	}

	[GtkCallback]
	void next_button_clicked (Button button) {
		stdout.printf ("next\n");
	}
}