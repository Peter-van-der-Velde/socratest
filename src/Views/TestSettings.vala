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

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/test_settings.ui")]
public class Socratest.TestSettings : Gtk.Box {

	private Stack main_stack;

	[GtkChild]
	private Label order;

	[GtkChild]
	private Label type_label;

	[GtkChild]
	private CheckButton repeat;

	public TestSettings (Stack main_stack) {
		this.main_stack = main_stack;
		order.set_text (_("Order:"));
		type_label.set_text (_("Type of test:"));
		repeat.set_label (_("Repeat until every anwser is correct"));
	}

	[GtkCallback]
	private void start_button_clicked (Button button) {
		stdout.printf ("clicked on the start button\n");
		main_stack.set_visible_child_name ("Test View");
	}
}
