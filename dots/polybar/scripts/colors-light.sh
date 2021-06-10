#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/scripts/rofi/colors.rasi"

# Change colors
change_color() {
	# polybar
	sed -i -e 's/background = #.*/background = #00000000/g' $PFILE
	sed -i -e 's/foreground = #.*/foreground = #FFFFFF/g' $PFILE
	sed -i -e 's/foreground-alt = #.*/foreground-alt = #1F1F1F/g' $PFILE
	sed -i -e "s/color1 = #.*/color1 = $SH1/g" $PFILE
	sed -i -e "s/color2 = #.*/color2 = $SH2/g" $PFILE
	sed -i -e "s/color3 = #.*/color3 = $SH3/g" $PFILE
	sed -i -e "s/color4 = #.*/color4 = $SH4/g" $PFILE
	sed -i -e "s/color5 = #.*/color5 = $SH5/g" $PFILE
	sed -i -e "s/color6 = #.*/color6 = $SH6/g" $PFILE
	sed -i -e "s/color7 = #.*/color7 = $SH7/g" $PFILE
	sed -i -e "s/color8 = #.*/color8 = $SH8/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    #FFFFFFFF;
	  bg1:   ${SH2}FF;
	  bg2:   ${SH3}FF;
	  bg3:   ${SH4}FF;
	  bg4:   ${SH5}FF;
	  fg:    #2E2E2EFF;
	}
	EOF
	
	polybar-msg cmd restart
}

if  [[ $1 = "--light" ]]; then
	SH1="#FF6F00"	SH2="#B71C1C"	SH3="#0D47A1"	SH4="#004D40"
	SH5="#1A237E"	SH6="#3E2723"	SH7="#1B5E20"	SH8="#FFE082"
	change_color
else
	cat <<- _EOF_
	ERROR occured
	_EOF_
fi
