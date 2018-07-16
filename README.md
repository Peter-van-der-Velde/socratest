<div align="center">
  <span align="center"> <img width="80" height="70" class="center" src="https://gitlab.com/Peter_van_der_Velde/socratest/blob/master/data/images/com.gitlab.Peter_van_der_Velde.socratest.png" alt="Icon"></span>
  <h1 align="center">Socratest</h1>
  <h3 align="center">Your new personal digital teacher!</h3>
</div>

<br/>

<p align="center">
    <a href="https://appcenter.elementary.io/com.gitlab.Peter_van_der_Velde.socratest">
        <img src="https://appcenter.elementary.io/badge.svg">
    </a>
</p>

<p align="center">
  <a href="https://gitlab.com/Peter_van_der_Velde/socratest/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/License-GPL-3.0-blue.svg">
  </a>
  <a href="https://gitlab.com/Peter_van_der_Velde/socratest/releases">
    <img src="https://img.shields.io/badge/Release-v%201.0.0-orange.svg">
  </a>
</p>

<p align="center">
    <img  src="https://gitlab.com/Peter_van_der_Velde/socratest/blob/master/data/images/screenshot.png" alt="Screenshot"> <br>
  <a href="https://gitlab.com/Peter_van_der_Velde/socratest/issues/new"> Report a problem! </a>
</p>

## Installation

### Dependencies
These dependencies must be present before building:
 - `meson`
 - `valac`
 - `debhelper`
 - `libgranite-dev`
 - `libgtk-3-dev`
 - `libsqlite-3-dev`


Use the App script to simplify installation by running `./app install-deps`
 
 ### Building

```bash
git clone https://gitlab.com/Peter_van_der_Velde/socratest.git com.gitlab.Peter_van_der_Velde.socratest && cd com.gitlab.Peter_van_der_Velde.socratest
#./app install-deps works only on ubuntu based systems
./app install-deps && ./app install
```

### Deconstruct

```
./app uninstall
```

### Development & Testing

Socratest includes a script to simplify the development process. This script can be accessed in the main project directory through `./app`.

```
Usage:
  ./app [OPTION]

Options:
  clean             Removes build directories (can require sudo)
  generate-i18n     Generates .pot and .po files for i18n (multi-language support)
  install           Builds and installs application to the system (requires sudo)
  install-deps      Installs missing build dependencies
  run               Builds and runs the application
  test              Builds and runs testing for the application
  test-run          Builds application, runs testing and if successful application is started
  uninstall         Removes the application from the system (requires sudo)
```

### Contributing

To help, access the links below:

- [Guide on Code Style](https://gitlab.com/Peter_van_der_Velde/socratest/wiki/Guide-on-code-style)

- [Proposing Design Changes](https://gitlab.com/Peter_van_der_Velde/socratest/wiki/Proposing-Design-Changes)

- [Reporting Bugs](https://gitlab.com/Peter_van_der_Velde/socratest/wiki/Reporting-Bugs)

- [Translate](https://gitlab.com/Peter_van_der_Velde/socratest/wiki/Translate)


### License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE.md) file for details.
