FROM python:2.7-alpine

# Set environment variables that can be overwritten 
ENV AUTH_SERVICE "ptc" 
ENV USERNAME "username" 
ENV PASSWORD "password" 
ENV LOCATION "Brisbane, Queensland, Australia"
ENV GOOGLE_MAPS_KEY "google-maps-key" 
ENV MAX_STEPS 5
ENV CATCH_POKEMON true
ENV WALK 4.16
ENV ACTION_WAIT_MIN 1
ENV ACTION_WAIT_MAX 4
ENV DEBUG false
ENV TEST false
ENV HEALTH_RECORD true
ENV LOCATION_CACHE true
ENV DISTANCE_UNIT "km" 
ENV RECONNECTING_TIMEOUT 15
ENV ITEM_FILTER '{"1": { "keep" : 100 }, "101": { "keep" : 10 }, "102": { "keep" : 30 }, "103": { "keep" : 30 }, "201": { "keep" : 30 }, "701": { "keep" : 100 }}'
ENV EVOLVE_ALL "NONE"
ENV EVOLVE_SPEED 20
ENV EVOLVE_CP_MIN 300
ENV USE_LUCKY_EGG false
ENV HATCH_EGGS true
ENV LONGER_EGGS_FIRST true
ENV EVOLVE_CAPTURED false
ENV RELEASE_POKEMON true
ENV SPIN_FORTS '{"avoid_circles": false,"max_circle_size": 10}'
ENV CATCH '{"any": {"catch_above_cp": 0, "catch_above_iv": 0, "logic": "or"}}'
ENV RELEASE '{"any": {"release_below_cp": 400, "release_below_iv": 0.4, "logic": "or"}}'

# Working directory for the application
WORKDIR /usr/src/app

# add certificates to talk to the internets
RUN apk add --no-cache ca-certificates git nano protobuf

# Clone app into workdir
RUN git clone -b dev https://github.com/PokemonGoF/PokemonGo-Bot .

# Install all prerequisites (build base used for gcc of some python modules)
RUN apk add --no-cache build-base \
 && pip install --no-cache-dir -r requirements.txt \
 && apk del build-base

# Write the config.json because someone decided to stop the params from working
RUN echo "{" \
		"\"auth_service\": \"$AUTH_SERVICE\", " \
		"\"username\": \"$USERNAME\", " \
		"\"password\": \"$PASSWORD\", " \
		"\"location\": \"$LOCATION\", " \
		"\"gmapkey\": \"$GOOGLE_MAPS_KEY\", " \
		"\"max_steps\": $MAX_STEPS, " \
		"\"catch_pokemon\": \"$CATCH_POKEMON\", " \
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

# Run poke bot
CMD python pokecli.py -cf config.json
