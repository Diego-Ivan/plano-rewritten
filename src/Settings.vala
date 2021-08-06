public class Plano.Settings : GLib.Settings {
    public bool dark_theme { get; set; }
    public int window_width { get; set; }
    public int window_height { get; set; }

    public Settings () {
        Object (
            schema_id: "com.github.diegoivanme.plano"
        );
        bind ("dark-theme", this, "dark-theme", GLib.SettingsBindFlags.DEFAULT);
        bind ("window-width", this, "window-width", GLib.SettingsBindFlags.DEFAULT);
        bind ("window-height", this, "window-height", GLib.SettingsBindFlags.DEFAULT);
    }
}
