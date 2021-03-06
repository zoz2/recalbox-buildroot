#!/bin/bash
declare -A ratiomap
ratiomap[arkanoid.zip]="8:7"
ratiomap[centiped.zip]="8:7"
ratiomap[dkongjr.zip]="8:7"
ratiomap[dkong.zip]="8:7"
ratiomap[frogger.zip]="8:7"
ratiomap[invaders.zip]="7:9"
ratiomap[mario.zip]="8:7"
ratiomap[missile.zip]="8:7"
ratiomap[mspacman.zip]="7:9"
ratiomap[pacmanm.zip]="7:9"
ratiomap[pacman.zip]="7:9"
ratiomap[starw.zip]="7:9"
ratiomap[zaxxon.zip]="8:7"

declare -A buttonsMap
buttonsMap[sf2.zip]="6"
buttonsMap[dstlk.zip]="6"
buttonsMap[hsf2j.zip]="6"
buttonsMap[msh.zip]="6"
buttonsMap[mshvsf.zip]="6"
buttonsMap[mvscu.zip]="6"
buttonsMap[nwarr.zip]="6"
buttonsMap[sf2cej.zip]="6"
buttonsMap[sfz2j.zip]="6"
buttonsMap[sfz3j.zip]="6"
buttonsMap[sfzj.zip]="6"
buttonsMap[ssf2tb.zip]="6"
buttonsMap[ssf2t.zip]="6"
buttonsMap[ssf2xj.zip]="6"
buttonsMap[ssf2.zip]="6"
buttonsMap[vsav2.zip]="6"
buttonsMap[vsav.zip]="6"
buttonsMap[vhunt2.zip]="6"
buttonsMap[xmvsf.zip]="6"
buttonsMap[xmcota.zip]="6"

emulator="$2"

fullfilename=$(basename "$1")
filename=$(printf '%q' "$fullfilename")

extension="${filename##*.}"
echo $fullfilename
echo $filename

echo $1

if [[ ! "$emulator" ]]; then
	#seeking emulator from extension (needed for news)
	if [[ "$extension" == "smc" || "$extension" == "sfc" ]]; then
        	emulator="snes"
	fi
	if [[ "$extension" == "nes" || "$extension" == "NES" ]]; then
        	emulator="nes"
	fi
	if [[ "$extension" == "SMS" || "$extension" == "sms" ]]; then
		emulator="mastersystem"
	fi
	if [[ "$extension" == "gba" ]]; then
		emulator="gba"
	fi
	if [[ "$extension" == "MD" || "$extension" == "md" ]]; then
		emulator="megadrive"
	fi
fi

retroarchbin="/usr/bin/retroarch"
gpspbin="/usr/emulators/gpsp/gpsp"
retroarchcores="/usr/lib/libretro"

if [[ "$emulator" == "psx" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/pcsx_rearmed_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi
if [[ "$emulator" == "snes" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/pocketsnes_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi
if [[ "$emulator" == "nes" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/fceunext_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "mastersystem" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/picodrive_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "sg1000" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/genesisplusgx_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "gba" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/gpsp_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
#	/recalbox/scripts/runcommand.sh 4 "$gpspbin \"/recalbox/share/roms/gba/${fullfilename}\""
fi

if [[ "$emulator" == "gbc" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/gambatte_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "fds" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/nestopia_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "megadrive" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/picodrive_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "segacd" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/picodrive_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "atari2600" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/stella_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi

if [[ "$emulator" == "pcengine" ]]; then
	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/pce_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi


if [[ "$emulator" == "msx" ]]; then
        if [[ "$extension" == "mx1" ]] ||  [[ "$extension" == "MX1" ]] ; then
                sed -i "s/^fmsx_mode = .*$/fmsx_mode = MSX1/g" /recalbox/configs/retroarch/cores/retroarch-core-options.cfg
        else
                sed -i "s/^fmsx_mode = .*$/fmsx_mode = MSX2/g" /recalbox/configs/retroarch/cores/retroarch-core-options.cfg
        fi
        /recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/fmsx_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg \"$1\""
fi


if [[ "$emulator" == "imame" ]]; then
	if [[ -n ${ratiomap[$filename]} ]]; then
        	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/imame4all_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg --appendconfig /recalbox/configs/retroarch/${ratiomap[$filename]}.cfg \"$1\""
	else
        	/recalbox/scripts/runcommand.sh 4 "$retroarchbin -L $retroarchcores/imame4all_libretro.so --config /recalbox/configs/retroarch/retroarchcustom.cfg --appendconfig /recalbox/configs/retroarch/4:3.cfg \"$1\""
	fi
fi

if [[ "$emulator" == "fba" ]]; then
        if [[ -n ${buttonsMap[$filename]} ]]; then
                /recalbox/scripts/runcommand.sh 4 "fba2x --configfile /recalbox/configs/fba/fba2x6btn.cfg \"$1\""
        else
                /recalbox/scripts/runcommand.sh 4 "fba2x --configfile /recalbox/configs/fba/fba2x.cfg \"$1\""
	fi
fi
