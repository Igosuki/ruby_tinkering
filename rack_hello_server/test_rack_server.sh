#!/bin/sh
curl -w "\n" http://localhost:9292  
curl -w "\n" http://localhost:9292/index.html 
curl -w "\n" http://localhost:9292/invalid 
curl -w "\n" http://localhost:9292/images 
curl -w "\n" http://localhost:9292/images/
curl -w "\n" http://localhost:9292/images/rack-logo.png 
curl -w "\n" "http://localhost:9292/../../../../forbidden" 
curl -w "\n" "http://localhost:9292/has%20a%20space/"
