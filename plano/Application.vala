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
    public Settings settings;
    public class Application : Adw.Application {
        public static Window window;

        public string[] accel_preferences = {"<Ctrl>comma"};
        public string[] close_app_accel = {"<Ctrl>Q", "<Ctrl>W"};
        public string[] about_app_accel = {"F1"};
        public string[] show_shortcuts_accel = {"<Primary>question"};

        public const GLib.ActionEntry[] APP_ENTRIES = {
            { "preferences", show_preferences_window },
            { "quit", quit_app },
            { "shortcuts", show_shortcuts_window },
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

            set_accels_for_action ("app.preferences", accel_preferences);
            set_accels_for_action ("app.quit", close_app_accel);
            set_accels_for_action ("app.about", about_app_accel);
            set_accels_for_action ("app.shortcuts", show_shortcuts_accel);

            add_action_entries (APP_ENTRIES, this);
            style_manager.set_color_scheme (Adw.ColorScheme.FORCE_DARK);

            settings.delay ();
        }

        protected override void activate () {
            if (window == null) {
                window = new Window (this);
            }
            add_window (window);
            window.present ();
        }

        protected override void shutdown () {
            base.shutdown ();
            settings.apply ();
            settings.set_string ("unit", settings.unit);
        }

        private void show_shortcuts_window () {
            try {
                var ui_builder = new Gtk.Builder ();
                ui_builder.add_from_resource ("/com/github/diegoivanme/plano/shortcuts.ui");
                var shortcuts_window = ui_builder.get_object ("Shortcuts") as Gtk.ShortcutsWindow;

                shortcuts_window.set_transient_for (window);
                shortcuts_window.show ();
            } catch (Error e) {
                critical ("An error occured while loading shortcuts window: %s", e.message);
            }
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
