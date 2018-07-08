using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/socratest/views/test.ui")]
public class Socratest.TestView : Gtk.Box {

	private string search_entry_text;

	[GtkChild]
	private Box home_box;

	public TestView () {
		search_entry_text = "";
	}

}
