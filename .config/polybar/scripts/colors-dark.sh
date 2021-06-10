#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/scripts/rofi/colors.rasi"

# Change colors
change_color() {
	# polybar
	sed -i -e 's/background = #.*/background = #00000000/g' $PFILE
	sed -i -e 's/foreground = #.*/foreground = #FFFFFF/g' $PFILE
	sed -i -e 's/foreground-alt = #.*/foreground-alt = #FFFFFF/g' $PFILE
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
	  bg:    #1F1F1FFF;
	  bg1:   ${SH2}FF;
	  bg2:   ${SH3}FF;
	  bg3:   ${SH1}FF;
	  fg:    #FFFFFFFF;
	}
	EOF
	
	polybar-msg cmd restart
}
if    [[ $1 = "--dark" ]]; then
        SH1="#FF6F00"   SH2="#0D47A1"   SH3="#004D40"   SH4="#B71C1C"
        SH5="#1B5E20"   SH6="#3E2723"   SH7="#1A237E"   SH8="#FFE082"
        change_color
else
	cat <<- _EOF_
	ERROR occured
	_EOF_
fi
