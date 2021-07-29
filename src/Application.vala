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
            Hdy.init ();
        }
        protected override void activate () {
            base.startup ();
            var window = new Window (this);
            add_window (window);
            window.present ();
        }
    }
}