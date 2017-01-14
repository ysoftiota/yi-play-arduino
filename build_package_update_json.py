#!/usr/bin/python

import json
import sys
import os

old = json.loads(open(sys.argv[1]).read())
new = json.loads(open(sys.argv[2]).read())

newplatform = new["packages"][0]["platforms"][0]

for package in old["packages"]:
	for platform in package["platforms"]:
		if platform["version"] == newplatform["version"]:
			print json.dumps(old, indent=4)
			sys.exit(0)

old["packages"][0]["platforms"].append(newplatform)

print json.dumps(old, indent=4)
sys.exit(0)