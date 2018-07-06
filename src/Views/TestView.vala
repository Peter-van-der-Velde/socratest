using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/libre_lehrer/test.ui")]
public class LibreLehrer.TestView : Gtk.Box {

	private string search_entry_text;

	[GtkChild]
	private Box home_box;

	public TestView () {
		// this.set_default_size (600,300);
		search_entry_text = "";
	}

}
