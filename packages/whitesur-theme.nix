{ stdenv
, fetchFromGitHub
, sass
, glib
, libxml2
, gdk-pixbuf
, gtk-engine-murrine
, gtk_engines
, optipng
, inkscape
}:
let
  color = "-light";
  opacity = "";
  alt = "";
  icon = "";
  nix-snowflake = ./nix-snowflake.svg;
in
stdenv.mkDerivation rec {
  version = "2020-12-03";
  pname = "WhiteSur-gtk-theme";

  # https://github.com/vinceliuice/WhiteSur-gtk-theme
  src = fetchFromGitHub {
    repo = pname;
    owner = "vinceliuice";
    rev = "989c3be9f5f128beae21bfed2c06ea9adff9dec0";
    sha256 = "1wkd70mjjqjxn2aiy28m6wd2jg64nxmvvkaym3wmjiqmw2ax1a08";
  };

  nativeBuildInputs =
    [ sass glib libxml2 gdk-pixbuf gtk_engines optipng inkscape ];

  propagatedUserEnvPkgs = [ gtk-engine-murrine ];

  #  if [[ ${alt} == '-alt' || ${opacity} == '-solid' ]] &&  [[ ${color} == '-light' ]]; then
  #   cp -r src/assets/gnome-shell/activities-black/activities${icon}.svg $out/share/themes/whitesur/gnome-shell/assets/activities.svg
  # fi

  installPhase = ''
    mkdir -p $out/share/themes/whitesur

    mkdir -p $out/share/themes/whitesur

    echo "[Desktop Entry]" >> $out/share/themes/whitesur/index.theme
    echo "Type=X-GNOME-Metatheme" >> $out/share/themes/whitesur/index.theme
    echo "Name=WhiteSur${color}${opacity}" >> $out/share/themes/whitesur/index.theme
    echo "Comment=An Stylish Gtk+ theme based on Elegant Design" >> $out/share/themes/whitesur/index.theme
    echo "Encoding=UTF-8" >> $out/share/themes/whitesur/index.theme
    echo "" >> $out/share/themes/whitesur/index.theme
    echo "[X-GNOME-Metatheme]" >> $out/share/themes/whitesur/index.theme
    echo "GtkTheme=WhiteSur${color}${opacity}" >>  $out/share/themes/whitesur/index.theme
    echo "MetacityTheme=WhiteSur${color}${opacity}" >>  $out/share/themes/whitesur/index.theme
    echo "IconTheme=McMojave-circle" >> $out/share/themes/whitesur/index.theme
    echo "CursorTheme=McMojave-circle" >> $out/share/themes/whitesur/index.theme
    echo "ButtonLayout=close,minimize,maximize:menu" >> $out/share/themes/whitesur/index.theme

    mkdir -p $out/share/themes/whitesur/gnome-shell
    cp -r src/assets/gnome-shell/source-assets/* $out/share/themes/whitesur/gnome-shell
    cp -r src/main/gnome-shell/gnome-shell${color}${opacity}${alt}.css $out/share/themes/whitesur/gnome-shell/gnome-shell.css
    cp -r src/assets/gnome-shell/common-assets $out/share/themes/whitesur/gnome-shell/assets
    cp -r src/assets/gnome-shell/assets${color}/*.svg $out/share/themes/whitesur/gnome-shell/assets
    cp -r ${nix-snowflake} $out/share/themes/whitesur/gnome-shell/assets/activities.svg

    mkdir -p $out/share/themes/whitesur/gtk-2.0
    cp -r src/main/gtk-2.0/gtkrc${color} $out/share/themes/whitesur/gtk-2.0/gtkrc
    cp -r src/main/gtk-2.0/menubar-toolbar${color}.rc $out/share/themes/whitesur/gtk-2.0/menubar-toolbar.rc
    cp -r src/main/gtk-2.0/common/*.rc $out/share/themes/whitesur/gtk-2.0
    cp -r src/assets/gtk-2.0/assets${color} $out/share/themes/whitesur/gtk-2.0/assets

    mkdir -p $out/share/themes/whitesur/gtk-3.0
    cp -r src/assets/gtk-3.0/common-assets/assets $out/share/themes/whitesur/gtk-3.0
    cp -r src/assets/gtk-3.0/common-assets/sidebar-assets/*.png $out/share/themes/whitesur/gtk-3.0/assets
    cp -r src/assets/gtk-3.0/windows-assets/titlebutton${alt} $out/share/themes/whitesur/gtk-3.0/windows-assets
    cp -r src/assets/gtk-3.0/thumbnail${color}.png $out/share/themes/whitesur/gtk-3.0/thumbnail.png
    cp -r src/main/gtk-3.0/gtk-dark${opacity}.css $out/share/themes/whitesur/gtk-3.0/gtk-dark.css

    if [[ ${color} == '-light' ]]; then
      cp -r src/main/gtk-3.0/gtk-light${opacity}.css $out/share/themes/whitesur/gtk-3.0/gtk.css
    else
      cp -r src/main/gtk-3.0/gtk-dark${opacity}.css $out/share/themes/whitesur/gtk-3.0/gtk.css
    fi

    glib-compile-resources --sourcedir=$out/share/themes/whitesur/gtk-3.0 --target=$out/share/themes/whitesur/gtk-3.0/gtk.gresource src/main/gtk-3.0/gtk.gresource.xml
    rm -rf $out/share/themes/whitesur/gtk-3.0/{assets,windows-assets,gtk.css,gtk-dark.css}
    echo '@import url("resource:///org/gnome/theme/gtk.css");' >> $out/share/themes/whitesur/gtk-3.0/gtk.css
    echo '@import url("resource:///org/gnome/theme/gtk-dark.css");' >> $out/share/themes/whitesur/gtk-3.0/gtk-dark.css

    mkdir -p $out/share/themes/whitesur/metacity-1
    cp -r src/main/metacity-1/metacity-theme${color}.xml $out/share/themes/whitesur/metacity-1/metacity-theme-1.xml
    cp -r src/main/metacity-1/metacity-theme-3.xml $out/share/themes/whitesur/metacity-1
    cp -r src/assets/metacity-1/assets/*.png $out/share/themes/whitesur/metacity-1
    cp -r src/assets/metacity-1/thumbnail${color}.png $out/share/themes/whitesur/metacity-1/thumbnail.png
    ln -s $out/share/themes/whitesur/metacity-1/metacity-theme-1.xml $out/share/themes/whitesur/metacity-1/metacity-theme-2.xml

    mkdir -p $out/share/themes/whitesur/xfwm4
    cp -r src/assets/xfwm4/assets${color}/*.png $out/share/themes/whitesur/xfwm4
    cp -r src/main/xfwm4/themerc${color} $out/share/themes/whitesur/xfwm4/themerc

    mkdir -p $out/share/themes/whitesur/cinnamon
    cp -r src/main/cinnamon/cinnamon${color}${opacity}.css $out/share/themes/whitesur/cinnamon/cinnamon.css
    cp -r src/assets/cinnamon/common-assets $out/share/themes/whitesur/cinnamon/assets
    cp -r src/assets/cinnamon/assets${color}/*.svg $out/share/themes/whitesur/cinnamon/assets
    cp -r src/assets/cinnamon/thumbnail${color}.png $out/share/themes/whitesur/cinnamon/thumbnail.png

    mkdir -p $out/share/themes/whitesur/plank
    cp -r src/other/plank/theme${color}/*.theme $out/share/themes/whitesur/plank

    echo -e 'VteTerminal,\n TerminalScreen,\n vte-terminal {\n  padding: 30px 30px 30px 30px;\n  -VteTerminal-inner-border: 30px 30px 30px 30px;\n}' >> $out/share/themes/whitesur/gtk-3.0/gtk.css
  '';

}
