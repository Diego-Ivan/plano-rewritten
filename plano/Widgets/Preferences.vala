namespace Plano {
    [GtkTemplate (ui = "/com/github/diegoivanme/plano/preferences.ui")]
    public class Preferences : Adw.PreferencesWindow {
        [GtkChild] unowned Gtk.SpinButton decimals_spin_button;
        [GtkChild] unowned Gtk.Switch switcher_use_default;
        [GtkChild] unowned Gtk.Switch switcher_prefer_dark;

        Adw.StyleManager style_manager = Adw.StyleManager.get_default ();

        public Preferences () {
            set_transient_for (Application.window);
            settings.bind (
                "decimals",
                decimals_spin_button,
                "value",
                GLib.SettingsBindFlags.DEFAULT
            );
            settings.bind (
                "prefer-dark-theme",
                switcher_prefer_dark,
                "active",
                GLib.SettingsBindFlags.DEFAULT
            );
            settings.bind (
                "use-system-schema",
                switcher_use_default,
                "active",
                GLib.SettingsBindFlags.DEFAULT
            );
            settings.bind (
                "use-system-schema",
                switcher_prefer_dark,
                "sensitive",
                GLib.SettingsBindFlags.INVERT_BOOLEAN
            );
            show ();
        }

        public static void open () {
            new Preferences ();
        }

        [GtkCallback]
        void use_default_active_changed_cb () {
            if (switcher_use_default.active)
                style_manager.set_color_scheme (Adw.ColorScheme.DEFAULT);
        }

        [GtkCallback]
        void prefer_dark_sensitive_changed_cb () {
            if (switcher_prefer_dark.sensitive) {
                if (switcher_prefer_dark.active)
                    style_manager.set_color_scheme (Adw.ColorScheme.FORCE_DARK);
                else
                    style_manager.set_color_scheme (Adw.ColorScheme.FORCE_LIGHT);
            }
        }

        [GtkCallback]
        void prefer_dark_active_changed_cb () {
            if (switcher_prefer_dark.active)
                style_manager.set_color_scheme (Adw.ColorScheme.FORCE_DARK);
            else
                style_manager.set_color_scheme (Adw.ColorScheme.FORCE_LIGHT);
        }

    }
}
