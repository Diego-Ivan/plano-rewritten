public class Plano.Settings : GLib.Settings {
    public bool dark_theme { get; set; }
    public int decimals { get; set; }

    public Settings () {
        Object (
            schema_id: "com.github.diegoivanme.plano"
        );
        bind ("dark-theme", this, "dark-theme", GLib.SettingsBindFlags.DEFAULT);
        bind ("decimals", this, "decimals", GLib.SettingsBindFlags.DEFAULT);
    }
}