#!/usr/bin/make -f

include $(PWD)/.env

wget := wget -q -O - --header "AS-Key: $(AS_KEY)"

iwwc-custom.json: iwwc-info.json
	$(wget) 'https://api.agent-stats.com/groups/$(AS_GROUP_ID)/custom' > ".tmp.$@"
	mv ".tmp.$@" "$@"

iwwc-info.json:
	$(wget) 'https://api.agent-stats.com/groups/$(AS_GROUP_ID)/info' > ".tmp.$@"
	set -x;if ! [ -e "$@" ] || ! cmp -s "$@" ".tmp.$@"; then mv ".tmp.$@" "$@"; fi

refresh:
	$(wget) --method post 'https://api.agent-stats.com/groups/$(AS_GROUP_ID)/refresh'


.PHONY: refresh
