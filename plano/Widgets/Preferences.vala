namespace Plano {
    [GtkTemplate (ui = "/com/github/diegoivanme/plano/preferences.ui")]
    public class Preferences : Adw.PreferencesWindow {
        [GtkChild] unowned Gtk.Switch darkThemeSwitch;

        public Preferences () {
            set_transient_for (Application.window);
            settings.bind (
                "dark-theme",
                darkThemeSwitch,
                "active",
                GLib.SettingsBindFlags.DEFAULT
            );
            show ();
        }

        public static void open () {
            new Preferences ();
        }
    }
}