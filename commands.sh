#!/bin/bash
# Edit your commands in this file.

# This file is public domain in the USA and all free countries.
# Elsewhere, consider it to be WTFPLv2. (wtfpl.net/txt/copying)

if [ "$1" = "source" ];then
	# Place the token in the token file
	TOKEN=$(cat token)
	# Set INLINE to 1 in order to receive inline queries.
	# To enable this option in your bot, send the /setinline command to @BotFather.
	INLINE=0
	# Set to .* to allow sending files from all locations
	FILE_REGEX='/home/user/allowed/.*'
else
	case $MESSAGE in
		'/info')
			send_markdown_message "${CHAT[ID]}" "This is bashbot, the *Telegram* bot written entirely in *bash*."
			;;
		'/start')
			send_action "${CHAT[ID]}" "typing"
			send_markdown_message "${CHAT[ID]}" "Si has llegado hasta aqui, puede que necesites este numerito -> ${CHAT[ID]}"
			;;
		*)	
			if tmux ls | grep -v send | grep -q $copname;then inproc; else send_message "${CHAT[ID]}" "$MESSAGE" "safe";fi
			;;
	esac
fi
