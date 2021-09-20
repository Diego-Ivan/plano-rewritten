plano_sources += [
  'main.vala',
  'Application.vala',
  'Plane.vala',
  'Settings.vala',
  'Widgets/Window.vala',
  'Widgets/Entry.vala',
  'Widgets/Preferences.vala',
]

if get_option('profile') == 'development'
  name_prefix = '(Development) '
  profile = 'Devel'
else
  name_prefix = ''
  profile = ''
endif

plano_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk4', version: '>= 4.2.1'),
  dependency('libadwaita-1', version: '>= 1.0.0'),
]

app_id = '@0@@1@'.format(meson.project_name(), profile)

conf = configuration_data()
conf.set_quoted('APP_ID', app_id)
conf.set_quoted('G_LOG_DOMAIN', 'Plano')
conf.set_quoted('NAME_PREFIX', name_prefix)
conf.set_quoted('PACKAGE_NAME', meson.project_name())
conf.set_quoted('PACKAGE_VERSION', meson.project_version())
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf.set_quoted('DATADIR', join_paths(get_option('prefix'), get_option('datadir')))
conf.set_quoted('GNOMELOCALEDIR', join_paths(get_option('prefix'), get_option('localedir')))
configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')


add_project_arguments(
    '-include', 'config.h',
    '-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name()),
    language: 'c'
)

add_project_arguments([
		'--target-glib=2.40',
	],
	language: 'vala',
)

executable('plano', plano_sources,
  vala_args: [meson.source_root() + '/plano/Config.vapi'],
  dependencies: plano_deps,
  install: true,
)
