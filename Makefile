build:
	docker build -t rhara/chemge:0.1 .

run:
	docker run -t -i -v ~/data:/data -v $$PWD:/supp -p 8888:8888 rhara/chemge:0.1 bash

clean:
	@running="$$(docker ps -aq)" ; \
	if [ -n "$$running" ] ; then \
	    echo Removing instances $$running ; \
		docker rm -f $$running ; \
	fi ; \
	nones="$$(docker images | grep none | awk '{print $$3}')" ; \
	if [ -n "$$nones" ] ; then \
		echo Removing images $$nones ; \
		docker rmi $$nones ; \
	fi ;

