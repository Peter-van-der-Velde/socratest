
[GtkTemplate (ui = "/com/gitlab/Peter_van_der_Velde/libre_lehrer/main.ui")]
public class LibreLehrer.Window : Gtk.Window {

	public Window () {
		this.set_default_size (600,300);
	}



}

[GtkCallback]
void go_home () {
	stdout.printf("clicked on the home button");
}
