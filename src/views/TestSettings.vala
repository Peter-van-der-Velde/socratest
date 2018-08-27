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
	private ComboBoxText order_combobox;

	[GtkChild]
	private Label type_label;

	[GtkChild]
	private ComboBoxText type_of_test_combobox;

	[GtkChild]
	private Switch repeat;

	[GtkChild]
	private Label repeat_label;

	[GtkChild]
	private Button start_button;

	public TestSettings (Stack main_stack) {
		this.main_stack = main_stack;
		// manually set the text so it can easily be translated using po
		order.set_text (_("Order:"));
		type_label.set_text (_("Type of test:"));
		repeat_label.set_text (_("Repeat until every anwser is correct"));

		order_combobox.append ("LR", "L - R");
		order_combobox.append ("RL", "R - L");
		order_combobox.append ("both", _("Both"));
		order_combobox.append ("rnd", _("Random"));
		order_combobox.active = 0;

		type_of_test_combobox.append ("trad", _("Traditional"));
		type_of_test_combobox.append ("abc", _("A, B, C"));
		type_of_test_combobox.active = 0;

		start_button.set_label (_("Start"));

		// get the last set test settings
		var settings = Socratest.Configs.Settings.get_instance ();
		switch (settings.test_word_order) {
			case "L - R":
				order_combobox.active = 0;
				break;
			case "R - L":
				order_combobox.active = 1;
				break;
			case "Both":
				order_combobox.active = 2;
				break;
			case "Random":
				order_combobox.active = 3;
				break;
		}

		switch (settings.type_of_test) {
			case "Traditional":
				order_combobox.active = 0;
				break;
			case "A, B, C":
				order_combobox.active = 1;
				break;
		}

		// sets the repeat switch on active or not according to the gsettings value
		repeat.active = settings.repeat;

	}

	[GtkCallback]
	private void start_button_clicked (Button button) {
		// set the gsettings-settings to the settings set in the view
		var settings = Socratest.Configs.Settings.get_instance ();
		switch (order_combobox.active) {
			case 0:
				settings.test_word_order = "L - R";
				break;
			case 1:
				settings.test_word_order = "R - L";
				break;
			case 2:
				settings.test_word_order = "Both";
				break;
			case 3:
				settings.test_word_order = "Random";
				break;
		}

		switch (order_combobox.active) {
			case 0:
				settings.type_of_test = "Traditional";
				break;
			case 1:
				settings.type_of_test= "A, B, C";
				break;
		}

		// sets the repeat switch on active or not according to the gsettings value
		settings.repeat = repeat.active;

		main_stack.set_visible_child_name ("Test View");
	}
}
