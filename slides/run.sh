#!/bin/bash
# Licensed Internal Code - Property of IBM
# Restricted Materials of IBM
# Package: com.ibm.swget.dockersig
# (c) Copyright IBM Corp. 2013, 2014
# All Rights Reserved
# US Government Users Restricted Rights - Use, duplication or disclosure
# restricted by GSA ADP Schedule Contract with IBM Corp.
docker run -p 8000:8000 -t -i -d `pwd`:/revealjs/md parente/revealjs
