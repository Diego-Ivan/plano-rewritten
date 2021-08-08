/* Application.vala
 *
 * Copyright 2021 DiegoIvan <diegoivan.mae@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Plano {
    public static Settings settings;
    public class Application : Gtk.Application {
        public static Window window;
        // TODO: About dialog and Gettext domain
        public static Gtk.AboutDialog about_dialog;

        public string[] ACCEL_PREFERENCES = {"F1"};
        public string[] CLOSE_APP_ACCEL = {"<Ctrl>Q"};

        public const GLib.ActionEntry[] app_entries = {
            { "preferences", show_preferences_window },
            { "quit", quit_app }
        };
        public Application () {
            Object (
                application_id: "com.github.diegoivanme.plano",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void startup () {
            base.startup ();
            settings = new Settings ();
            Adw.init ();
            set_accels_for_action ("app.preferences", ACCEL_PREFERENCES);
            set_accels_for_action ("app.quit", CLOSE_APP_ACCEL);
            add_action_entries (app_entries, this);
        }

        protected override void activate () {
            base.startup ();
            window = new Window (this);
            add_window (window);
            window.present ();
        }

        private void show_preferences_window () {
            Preferences.open ();
        }

        private void quit_app () {
            window.close_request ();
            quit ();
        }
    }
}
