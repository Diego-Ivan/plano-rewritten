public class Plano.Settings : GLib.Settings {
    public int decimals { get; set; }
    public string unit { get; set; }

    public Settings () {
        Object (
            schema_id: "com.github.diegoivanme.plano"
        );
        bind ("unit", this, "unit", GLib.SettingsBindFlags.DEFAULT);
        bind ("decimals", this, "decimals", GLib.SettingsBindFlags.DEFAULT);
    }
}
