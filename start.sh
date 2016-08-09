#!/bin/bash

# Write config.json file with env vars
echo "{" \
	"\"auth_service\": \"$AUTH_SERVICE\", " \
	"\"username\": \"$USERNAME\", " \
	"\"password\": \"$PASSWORD\", " \
	"\"location\": \"$LOCATION\", " \
	"\"gmapkey\": \"$GOOGLE_MAPS_KEY\", " \
	"\"libencrypt_location\": \"\", " \
	"\"tasks\": $TASKS, " \
	"\"map_object_cache_time\": 5, " \
	"\"forts\": $FORTS, " \
	"\"websocket_server\": $WEBSOCKET_SERVER, " \
	"\"walk\": $WALK, " \
	"\"action_wait_min\": $ACTION_WAIT_MIN, " \
	"\"action_wait_max\": $ACTION_WAIT_MAX, " \
	"\"debug\": $DEBUG, " \
	"\"test\": $TEST, " \
	"\"health_record\": $HEALTH_RECORD, " \
	"\"location_cache\": $LOCATION_CACHE, " \
	"\"distance_unit\": \"$DISTANCE_UNIT\", " \
	"\"reconnecting_timeout\": $RECONNECTING_TIMEOUT, " \
	"\"evolve_captured\": $EVOLVE_CAPTURED, " \
	"\"catch_randomize_reticle_factor\": $CATCH_RANDOMIZE_RETICLE_FACTOR, " \
	"\"catch_randomize_spin_factor\": $CATCH_RANDOMIZE_SPIN_FACTOR, " \
	"\"catch\": $CATCH, " \
	"\"release\": $RELEASE, " \
	"\"vips\": $VIPS " \
	"}" \
> configs/config.json
	
# Start bot 
python pokecli.py 