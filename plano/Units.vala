/* Units.vala
 *
 * Copyright 2021 Diego Iván <diegoivan.mae@gmail.com>
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */


namespace Plano {
    public struct Unit {
        string pretty_name;
        string abbreviation;
    }

    public class UnitList : ListModel, Object {
        public Unit* selected_unit { get; set; }

        public Unit[] units = {
            { _("None"), "" },
            { _("Centimeters"), "cm" },
            { _("Meters"), "m" },
            { _("Kilometers"), "km" },
            { _("Inches"), "in" },
            { _("Feet"), "ft" },
            { _("Miles"), "mi" }
        };

        public GLib.Object? get_item (uint position)
            requires (position < units.length) {
            var string_object = new Gtk.StringObject (units[position].pretty_name);
            selected_unit = &units[position];

            return string_object;
        }

        public uint get_position_from_abbreviation (string str) {
            for (uint i = 0; i < units.length; i++) {
                if (units[i].abbreviation == str)
                    return i;
            }

            assert_not_reached ();
        }

        public uint get_n_items () {
            return units.length;
        }

        public Type get_item_type () {
            return typeof (Gtk.StringObject);
        }
    }
}
