using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/libre_lehrer/home.ui")]
public class LibreLehrer.Home : Gtk.Box {

	private string search_entry_text;

	[GtkChild]
	private Box home_box;

	public Home () {
		// this.set_default_size (600,300);
		search_entry_text = "";
	}

	[GtkCallback]
	void search_entry_changed (Editable search_entry) {
		search_entry_text = ((SearchEntry)search_entry).get_text();
		stdout.printf("wrote \"%s\" in the search entry\n", search_entry_text);
	}

	[GtkCallback]
	void play_button_clicked (Button button) {
		stdout.printf("clicked on the play button\n");
	}

	[GtkCallback]
	void add_button_clicked (Button button) {
		stdout.printf("clicked on the add button\n");
	}

	[GtkCallback]
	void edit_button_clicked (Button button) {
		stdout.printf("clicked on the edit button\n");
	}

	[GtkCallback]
	void remove_button_clicked (Button button) {
		stdout.printf("clicked on the remove button\n");
	}

}
