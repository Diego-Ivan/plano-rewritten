/* Preferences.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */


namespace Plano {
    [GtkTemplate (ui = "/com/github/diegoivanme/plano/preferences.ui")]
    public class Preferences : Adw.PreferencesWindow {
        [GtkChild] unowned Gtk.SpinButton decimals_spin_button;
        [GtkChild] unowned Adw.ComboRow unit_combo_row;

        public string selected_unit { get; set; }
        public UnitList unit_model = new UnitList ();

        public Preferences () {
            set_transient_for (Application.window);
            settings.bind (
                "decimals",
                decimals_spin_button, "value",
                GLib.SettingsBindFlags.DEFAULT
            );

            settings.bind (
                "unit",
                this, "selected_unit",
                GLib.SettingsBindFlags.DEFAULT
            );

            var unit_pos = unit_model.get_position_from_abbreviation (settings.unit);
            unit_combo_row.set_selected (unit_pos);

            show ();
        }

        construct {
            unit_combo_row.set_model (unit_model);
        }

        public static void open () {
            new Preferences ();
        }

        [GtkCallback]
        void on_unit_change_cb () {
            selected_unit = unit_model.selected_unit.abbreviation;
        }
    }
}
