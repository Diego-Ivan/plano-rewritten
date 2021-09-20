namespace Plano {
    [GtkTemplate (ui = "/com/github/diegoivanme/plano/preferences.ui")]
    public class Preferences : Adw.PreferencesWindow {
        [GtkChild] unowned Gtk.Switch darkThemeSwitch;
        [GtkChild] unowned Gtk.SpinButton decimalsSpinButton;

        public Preferences () {
            set_transient_for (Application.window);
            settings.bind (
                "dark-theme",
                darkThemeSwitch,
                "active",
                GLib.SettingsBindFlags.DEFAULT
            );
            settings.bind (
                "decimals",
                decimalsSpinButton,
                "value",
                GLib.SettingsBindFlags.DEFAULT
            );
            show ();
        }

        public static void open () {
            new Preferences ();
        }
    }
}
