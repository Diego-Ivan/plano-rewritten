plano_rewritten_sources = [
  'main.vala',
  'Widgets/Window.vala',
  'Application.vala',
  'Plane.vala',
  'Widgets/Entry.vala',
]

plano_rewritten_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('libhandy-1', version: '>= 1.0.0'),
]

gnome = import('gnome')

subdir ('Widgets')

executable('plano-rewritten', plano_rewritten_sources,
  vala_args: '--target-glib=2.50',  dependencies: plano_rewritten_deps,
  install: true,
)
