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
            double slope;
            run = coords1[0] + coords2[0];
            rise = coords1[1] + coords2[1];
            slope = rise/run;
            return slope;
        }

        public string get_midpoint () {
            string midpoint;
            midpoint = @"$(run/2), $(rise/2)";
            return midpoint;
        }
    }
}