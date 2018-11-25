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
using CircularProgressWidgets;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/test_results.ui")]
public class Socratest.TestResults : Gtk.Box {

	[GtkChild]
	private Button home_button;

	[GtkChild]
	private Viewport view_port;

	private Stack main_stack;
	private CircularProgressBar progress_bar;

	public TestResults (Stack main_stack) {
		this.main_stack = main_stack;
		progress_bar = new CircularProgressBar ();
		progress_bar.margin = 6;

		view_port.add (progress_bar);

		progress_bar.progress_fill_color = "#68b723";
		progress_bar.radius_fill_color = "#d4d4d4";
		progress_bar.radius_filled = true;
		// progress_bar.percentage = 0.3;
		progress_bar.line_width = 5;
		progress_bar.line_cap =  Cairo.LineCap.ROUND;
	}

	public void init (Test test) {
		progress_bar.percentage = test.get_score ();
	}

	[GtkCallback]
	private void home_button_clicked (Button button) {
		main_stack.set_visible_child_name ("Home View");
	}
}
