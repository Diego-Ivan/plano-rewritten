public class Plano.Settings : GLib.Settings {
    public bool dark_theme { get; set; }
    public int decimals { get; set; }

    public Settings () {
        Object (
            schema_id: "com.github.diegoivanme.plano"
        );
        bind ("decimals", this, "decimals", GLib.SettingsBindFlags.DEFAULT);
    }
}
