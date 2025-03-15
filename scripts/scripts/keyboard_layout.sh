#!/bin/bash

config=/home/heitor/.config
keymaps_folder="${config}/keymaps"
qtile_folder="${config}/qtile/settings"
files=(".qwerty_keymap" ".real_prog_dvorak")

set_keyboard() {
  layout=$1
  layout_index=$2
  layout_file=${files[$layout_index]}

  file="${keymaps_folder}/${layout_file}"
  echo $file
  if [ -e $file ]
  then
    export KEYBOARD_LAYOUT=$layout
    xmodmap $file
    xmodmap -e "clear lock"
    cp -f "${qtile_folder}/.kb_layouts/${layout}.py" "${qtile_folder}/keymaps.py"
    qtile cmd-obj -o cmd -f restart
    echo "keyboard changed to $layout"
  else
    echo "keymap file not found"
  fi
}

if [ -n $1 ]
then
  layout=$1
  case $layout in
    "qwerty" | "default")
      set_keyboard "qwerty" 0
      ;;

    "dvorak"| "dvp"| "real_prog"| "programming")
      set_keyboard "dvorak" 1
      ;;
    *)
      echo "Invalid layout name"
      ;;
  esac
fi
