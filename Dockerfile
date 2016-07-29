FROM python:2.7-alpine

# Set environment variables that can be overwritten 
ENV AUTH_SERVICE "google"
ENV USERNAME "username" 
ENV PASSWORD "password" 
ENV LOCATION "LAT LON"
ENV GOOGLE_MAPS_KEY "google-maps-api-key" 
ENV MAX_STEPS "5" 
ENV MODE "all" 
ENV WALK "4.16" 
ENV DEBUG "false" 
ENV TEST "false" 
ENV INITIAL_TRANSFER 0 
ENV LOCATION_CACHE "true" 
ENV DISTANCE_UNIT "km" 
ENV ITEM_FILTER "101,102,103,104" 
ENV EVOLVE_ALL "NONE"

# Working directory for the application
WORKDIR /usr/src/app

# add certificates to talk to the internets
RUN apk add --no-cache ca-certificates git nano 

# Clone app into workdir
RUN git clone https://github.com/PokemonGoF/PokemonGo-Bot .

# Install all prerequisites (build base used for gcc of some python modules)
RUN apk add --no-cache build-base \
 && pip install --no-cache-dir -r requirements.txt \
 && apk del build-base

# Rename release_config.json.example to release_config.json
RUN mv release_config.json.example release_config.json

# Write the config.json because someone decided to stop the params from working
RUN echo "{" \
		"\"auth_service\": \"$AUTH_SERVICE\", " \
		"\"username\": \"$USERNAME\", " \
		"\"password\": \"$PASSWORD\", " \
		"\"location\": \"$LOCATION\", " \
		"\"gmapkey\": \"$GOOGLE_MAPS_KEY\", " \
		"\"max_steps\": \"$MAX_STEPS\", " \
		"\"mode\": \"$MODE\", " \
		"\"walk\": \"$WALK\", " \
		"\"debug\": \"$DEBUG\", " \
		"\"test\": \"$TEST\", " \
		"\"initial_transfer\": \"$INITIAL_TRANSFER\", " \
		"\"location_cache\": \"$LOCATION_CACHE\", " \
		"\"distance_unit\": \"$DISTANCE_UNIT\", " \
		"\"item_filter\": \"$ITEM_FILTER\", " \
		"\"evolve_all\": \"$EVOLVE_ALL\" " \
		"}" \
	> config.json

CMD python pokecli.py

