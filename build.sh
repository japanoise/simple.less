#!/bin/sh
selec="$1"
if [ -z "$selec" ]
then
    selec="light"
fi

errormessage() {
    echo "$@" >&2
}

case "$selec" in
    light )
        # text & background
        fore='#222'
        back='white'
        # links
        link="$fore"
        hover="$fore"
        # blockquote: background & accent
        bqbak='#f9f9f9'
        bqacc='#ccc'
        ;;
    dark )
        # text & background
        fore='#a7a7a7'
        back='black'
        # links
        link="$fore"
        hover='#f535aa'
        # blockquote: background & accent
        bqbak='#222'
        bqacc='#5f5a60'
        ;;
    custom )
        if [ -z "$fore" ] || [ -z "$back" ]
        then
            errormessage "Must include at least foreground and background"
            exit 1
        fi
        if [ -z "$link" ]
        then
            errormessage "Link is blank, defaulting to foreground ($fore)"
            link="$fore"
        fi
        if [ -z "$hover" ]
        then
            errormessage "Hover is blank, defaulting to link ($link)"
            hover="$link"
        fi
        if [ -z "$bqbak" ]
        then
            errormessage "Bqbak is blank, defaulting to background ($back)"
            bqbak="$back"
        fi
        if [ -z "$bqacc" ]
        then
            errormessage "Bqacc is blank, defaulting to foreground ($fore)"
            bqacc="$fore"
        fi
        ;;
    * )
        errormessage "Unknown color scheme $selec"
        exit 1
        ;;
esac

lessc --global-var="blockquote-background=$bqbak" \
      --global-var="blockquote-accent=$bqacc" \
      --global-var="background=$back" \
      --global-var="foreground=$fore" \
      --global-var="link=$link" \
      --global-var="link-hover=$hover" \
      'simple.less' 'simple.css'
