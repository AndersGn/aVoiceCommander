#!/bin/bash          
	echo Add espeak (to get make it speak :-)
	apt-get install -y espeak
	# Test the voice
	espeak "hello"
	echo Install voice command software and its dependencies (pocketsphinx)
	apt-get install -y sphinxbase pocketsphinx sphinxtrain