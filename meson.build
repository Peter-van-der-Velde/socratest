project('com.gitlab.Peter_van_der_Velde.socratest', ['vala', 'c'],
	version : '1.0.0',
	license: 'GPL-3.0'
)

add_project_arguments([
		'-DGETTEXT_PACKAGE="@0@"'.format(meson.project_name())
	],
	language: 'c',
)

gnome = import('gnome')
i18n = import('i18n')

gresource = gnome.compile_resources(
	'as-resources', 'data/com.gitlab.Peter_van_der_Velde.socratest.gresource.xml',
	source_dir: 'data',
	c_name: 'as'
)

conf = configuration_data()
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

c_args = [
  '-include', 'config.h',
  '-g'
]

vala_args = [
	'--target-glib=2.38',
	'--debug',
]

sources = files()

subdir('data')
subdir('po')
subdir('src')


dependencies = [
	dependency('gobject-2.0'),
	dependency('glib-2.0'),
	dependency('granite'),
	dependency('gee-0.8'),
	dependency('gtk+-3.0'),
	dependency('sqlite3')
]

e = executable('com.gitlab.Peter_van_der_Velde.socratest',
	sources,
	gresource,
	vala_args:vala_args,
	c_args: c_args,
	dependencies: dependencies,
	install : true
)

meson.add_install_script('meson/post_install.py')
