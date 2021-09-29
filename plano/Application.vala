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
    public class Application : Adw.Application {
        public static Window window;

        public string[] ACCEL_PREFERENCES = {"<Ctrl>comma"};
        public string[] CLOSE_APP_ACCEL = {"<Ctrl>Q", "<Ctrl>W"};
        public string[] ABOUT_APP_ACCEL = {"F1"};
        public string[] CUSTOM_ACCEL = {"F2"};

        public const GLib.ActionEntry[] app_entries = {
            { "preferences", show_preferences_window },
            { "quit", quit_app },
            { "about", show_about_dialog }
        };

        public Application () {
            Object (
                application_id: "com.github.diegoivanme.plano",
                flags: ApplicationFlags.FLAGS_NONE
            );
            set_resource_base_path ("/com/github/diegoivanme/plano");

            Intl.setlocale (LocaleCategory.ALL, "");
            Intl.bindtextdomain (Config.GETTEXT_PACKAGE, Config.GNOMELOCALEDIR);
            Intl.textdomain (Config.GETTEXT_PACKAGE);
        }

        protected override void startup () {
            base.startup ();
            settings = new Settings ();
            set_accels_for_action ("app.preferences", ACCEL_PREFERENCES);
            set_accels_for_action ("app.quit", CLOSE_APP_ACCEL);
            set_accels_for_action ("app.about", ABOUT_APP_ACCEL);
            set_accels_for_action ("win.win_entry", CUSTOM_ACCEL);
            add_action_entries (app_entries, this);

            if (settings.get_boolean ("use-system-schema"))
                style_manager.set_color_scheme (Adw.ColorScheme.DEFAULT);

            else if (settings.get_boolean ("prefer-dark-theme"))
                style_manager.set_color_scheme (Adw.ColorScheme.FORCE_DARK);

            else
                style_manager.set_color_scheme (Adw.ColorScheme.FORCE_LIGHT);
        }

        protected override void activate () {
            if (window == null) {
                window = new Window (this);
            }
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

        public void show_about_dialog () {
            const string COPYRIGHT = "Copyright \xc2\xa9 2021 Diego Iván";

            const string? AUTHORS[] = {
                "Diego Iván",
                null
            };

            var program_name = "Plano";
            Gtk.show_about_dialog (window,
                                   "program-name", program_name,
                                   "logo-icon-name", Config.APP_ID,
                                   "version", Config.VERSION,
                                   "comments", _("A Cartesian Plane Calculator"),
                                   "copyright", COPYRIGHT,
                                   "authors", AUTHORS,
                                   "artists", null,
                                   "license-type", Gtk.License.GPL_3_0,
                                   "wrap-license", false,
                                   "translator-credits", _("translator-credits"),
                                   null
            );
        }
    }
}
