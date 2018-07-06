using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/libre_lehrer/test_settings.ui")]
public class LibreLehrer.TestSettings : Gtk.Box {

	private string search_entry_text;

	public TestSettings () {
		// this.set_default_size (600,300);
		search_entry_text = "";
	}
}
