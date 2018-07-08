using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/test_results.ui")]
public class Socratest.Welcome : Gtk.Box {

	private string search_entry_text;

	public Welcome () {
		search_entry_text = "";
	}
}
