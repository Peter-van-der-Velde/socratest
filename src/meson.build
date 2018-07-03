vala_args = [
    '--gresources=../data/com.gitlab.Peter_van_der_Velde.libre_lehrer.gresource.xml',
    '-g',
]

executable(
	meson.project_name(),
    'Application.vala',
    'main.vala',
    'Window.vala',
    resources,
    vala_args : vala_args,
    dependencies: [
        core_deps,
        dependency('gtk+-3.0'),
        dependency('granite')
    ],
    install : true
)
