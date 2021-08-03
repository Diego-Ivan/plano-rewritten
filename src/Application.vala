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

namespace PlanoRewritten {
    public class Application : Gtk.Application {
        public Application () {
            Object (
                application_id: "com.github.diegoivanme.plano",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void startup () {
            base.startup ();
            Adw.init ();
        }

        protected override void activate () {
            base.startup ();
            var window = new Window (this);
            add_window (window);
            window.present ();
        }
    }
}
