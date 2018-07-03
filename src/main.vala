public const string APP_NAME = "Libre Lehrer";
public const string TERMINAL_NAME = "libre_lehrer";

static int main (string args[]) {

	Environment.set_application_name (APP_NAME);
	Environment.set_prgname (APP_NAME);

	var application = new LibreLehrer.Application ();

	return application.run (args);
}
