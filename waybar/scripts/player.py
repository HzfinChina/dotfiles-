#!/usr/bin/python3
import subprocess
import re
import json

result = subprocess.run(["playerctl", "metadata"],capture_output=True,text = True)
output = result.stdout
artist_pattern = re.compile(r"xesam:artist\s+(.*)\s?\n")
title_pattern= re.compile(r"xesam:title\s+(.*)\s?\n")
artist_result = re.search(artist_pattern,output)
title_result = re.search(title_pattern,output)

data = dict()
try:
    assert artist_result != None and title_result != None
    data['text']=f"{title_result.group(1)}"
    data['tooltip'] = f"{artist_result.group(1)}-{title_result.group(1)}"
except:
    data['text'] = 'None'

print(json.dumps(data))
