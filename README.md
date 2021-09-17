<div align="center">
  <image src="data/Plano.png" width="10%">
    <h1>Plano</h1>
</div>

Plano, was my first Gtk Application, it was ugly and had obsufacted code. I do not promise this is perfect, but it is a great step forward on the first Plano, coded in GJS without the appropiate OO widgets.

Plano was rewritten in Vala and Libhandy has been implemented into the project, as well as styling with CSS to improve the UI and custom GtkWidgets

Plano is a graphical Application to calculate Cartesian Plane related operations, (Midpoint and Slope). This is an application I made when I was taking this topic in school, although I'm on vacations I ported it to Vala, as well as improved code and played around with Libhandy, Libadwaita and Gtk

See my project history over here. In legacy you can find commits in spanish and some messages expressing my learning course, it was kinda funny to read them tho.

| Repository/Branch | Version |
| ----------------- | ------- |
| [plano-legacy](https://github.com/DiegoIvanME/plano-legacy) | Legacy (GJS, GTK3) |
| main | Current Version (GTK4, Adwaita) |

## Building and Running

Meson (therefore Ninja), GTK4 development files and Vala compilers are required.

### Fedora 

```
sudo dnf install vala vala-devel gtk4-devel
```

Libadwaita will be built along with the project


### GNOME-Builder

Clone the project with `git clone https://github.com/diegoivanme/plano-rewritten` and run it.

### Meson

```
meson build
cd build
ninja install
```
