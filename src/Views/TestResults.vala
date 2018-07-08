using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/test_results.ui")]
public class Socratest.TestResults : Gtk.Box {

	private string search_entry_text;

	public TestResults () {
		search_entry_text = "";
	}
}
