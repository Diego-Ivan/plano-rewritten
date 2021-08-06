plano_sources += [
  'main.vala',
  'Application.vala',
  'Plane.vala',
  'Settings.vala',
  'Widgets/Window.vala',
  'Widgets/Entry.vala',
]

plano_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk4', version: '>= 4.2.1'),
  dependency('libadwaita-1', version: '>= 1.0.0'),
]

executable('plano', plano_sources,
  vala_args: '--target-glib=2.50',  dependencies: plano_deps,
  install: true,
)
