#!/usr/bin/make -f

include $(PWD)/.env

iwwc-custom.json:
	wget -q -O - --header "AS-Key: $(AS_KEY)" 'https://api.agent-stats.com/groups/$(AS_GROUP_ID)/custom' > "$@.tmp"
	mv "$@.tmp" "$@"

