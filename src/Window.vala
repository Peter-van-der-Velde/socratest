using Gtk;

[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/libre_lehrer/main.ui")]
public class LibreLehrer.Window : Gtk.Window {

	private string search_entry_text;
	private LibreLehrer.Home home_view;

	[GtkChild]
	private Button home_button;

	[GtkChild]
	private Stack main_stack;


	public Window () {
		this.set_default_size (600,300);
		search_entry_text = "";
		home_view = new LibreLehrer.Home();
		main_stack.add_named(home_view, "Home View");
	}

	// [GtkCallback]
	// void search_entry_changed (Editable search_entry) {
	// 	search_entry_text = ((SearchEntry)search_entry).get_text();
	// 	stdout.printf("wrote \"%s\" in the search entry\n", search_entry_text);
	// }

	// [GtkCallback]
	// void home_button_clicked (Button button) {
	// 	stdout.printf("clicked on the home button\n");
	// 	// home_button.hide();
	// 	this = home_view;
	// }

	// [GtkCallback]
	// void play_button_clicked (Button button) {
	// 	stdout.printf("clicked on the play button\n");
	// }

	// [GtkCallback]
	// void add_button_clicked (Button button) {
	// 	stdout.printf("clicked on the add button\n");
	// }

	// [GtkCallback]
	// void edit_button_clicked (Button button) {
	// 	stdout.printf("clicked on the edit button\n");
	// }

	// [GtkCallback]
	// void remove_button_clicked (Button button) {
	// 	stdout.printf("clicked on the remove button\n");
	// }

}

