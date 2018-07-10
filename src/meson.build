vala_args = [
    '--gresources=' + meson.source_root() + '/data/com.gitlab.Peter_van_der_Velde.socratest.gresource.xml',
    '-g',
]

vala_source = [
    'Window.vala',
    'Views/Home.vala',
    'Views/TestView.vala',
    'Views/TestSettings.vala',
    'Views/TestResults.vala',
    'Views/Welcome.vala',
    'Views/AddTest.vala',
    'Model/Word.vala',
    'Model/WordList.vala',
    'Model/Test.vala',
    'Model/TestDB.vala',
]

executable(
	meson.project_name(),
    'Application.vala',
    vala_source,
    resources,
    vala_args : vala_args,
    dependencies: [
        core_deps,
        dependency('gtk+-3.0'),
        dependency('granite'),
        dependency('gee-0.8'),
        dependency('sqlite3'),
        dependency('gio-2.0'),
    ],
    install : true
)
