using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/libre_lehrer/test_results.ui")]
public class LibreLehrer.TestResults : Gtk.Box {

	private string search_entry_text;

	public TestResults () {
		// this.set_default_size (600,300);
		search_entry_text = "";
	}
}