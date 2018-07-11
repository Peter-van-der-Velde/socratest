# Socratest
Your digital teacher who helpes you with it's practice tests.

### Prerequisites
to build this project you will need the following programs installed:
* gcc (or any c compiler)
* Meson
* gtk+-3.0 (>=3.10)
* granite
* gobject-2.0
* gee-0.8
* glib-2.0
* sqlite3

### Installing
```bash
# Clone the github repository
$ git clone https://gitlab.com/Peter_van_der_Velde/socratest.git

# Go inside the repository
$ cd socratest/

# To actually install it run:
$ meson build --prefix=/usr
$ cd build/
$ ninja
$ sudo ninja install
```

### License
This project is licensed under the GNU General Public License v3.0 License - see the [COPYING](COPYING) file for more details

