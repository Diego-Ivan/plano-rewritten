/* Plane.vala
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
    public class CartesianPlane : Object {
        private double[] coords1 = new double[2];
        private double[] coords2 = new double[2];
        private double rise;
        private double run;

        public void set_x1 (double value) {
            coords1[0] = value;
        }

        public void set_y1 (double value) {
            coords1[1] = value;
        }

        public void set_x2 (double value) {
            coords2[0] = value;
        }

        public void set_y2 (double value) {
            coords2[1] = value;
        }

        public double get_slope () {
            run = coords1[0] + coords2[0];
            rise = coords1[1] + coords2[1];
            double slope = rise/run;
            return slope;
        }

        public string get_midpoint () {
            string midpoint;
            midpoint = @"$(run/2), $(rise/2)";
            return midpoint;
        }
    }
}
