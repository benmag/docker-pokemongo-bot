#!/bin/bash

# Write config.json file with env vars
echo "{" \
	"\"auth_service\": \"$AUTH_SERVICE\", " \
	"\"username\": \"$USERNAME\", " \
	"\"password\": \"$PASSWORD\", " \
	"\"location\": \"$LOCATION\", " \
	"\"gmapkey\": \"$GOOGLE_MAPS_KEY\", " \
	"\"max_steps\": $MAX_STEPS, " \
	"\"catch_pokemon\": \"$CATCH_POKEMON\", " \
	"\"websocket_server\": $WEBSOCKET_SERVER, " \
	"\"spin_forts\": $SPIN_FORTS, " \
	"\"walk\": $WALK, " \
	"\"action_wait_min\": $ACTION_WAIT_MIN, " \
	"\"action_wait_max\": $ACTION_WAIT_MAX, " \
	"\"debug\": $DEBUG, " \
	"\"test\": $TEST, " \
	"\"health_record\": $HEALTH_RECORD, " \
	"\"location_cache\": $LOCATION_CACHE, " \
	"\"distance_unit\": \"$DISTANCE_UNIT\", " \
	"\"reconnecting_timeout\": $RECONNECTING_TIMEOUT, " \
	"\"item_filter\": $ITEM_FILTER, " \
	"\"evolve_all\": \"$EVOLVE_ALL\", " \
	"\"evolve_speed\": $EVOLVE_SPEED, " \
	"\"evolve_cp_min\": $EVOLVE_CP_MIN, " \
	"\"use_lucky_egg\": $USE_LUCKY_EGG, " \
	"\"longer_eggs_first\": $LONGER_EGGS_FIRST, " \
	"\"evolve_captured\": $EVOLVE_CAPTURED, " \
	"\"release_pokemon\": $RELEASE_POKEMON, " \
	"\"spin_forts\": $SPIN_FORTS, " \
	"\"catch\": $CATCH, " \
	"\"release\": $RELEASE " \
	"}" \
> config.json
	
# Start bot 
python pokecli.py -cf config.json