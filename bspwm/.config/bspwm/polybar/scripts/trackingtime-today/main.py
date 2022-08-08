#!/usr/bin/env python3

# Title: TrackingTime today total hrs
# Description: get total combined hrs from multiple TrackingTime accounts
# Author: Eyal Ron
# Developer: Eyal Ron
# License: MIT
# version: 1.0
# @create date 2022-08-08 02:34:29


import os
from dotenv import load_dotenv
import requests
import json
from math import modf
from datetime import date
import subprocess as subp

# loading .env variables
load_dotenv()

def get_entries(token,user_id,title):
    today = str(date.today())
    url = "https://app.trackingtime.co/api/v4/events?filter=USER&id="+user_id+"&from="+today+"&to="+today
    payload={}
    headers = {
      'Authorization': 'Basic '+token,
    }

    response = requests.request("GET", url, headers=headers, data=payload)
    tasks = json.loads(response.text)
    total = 0;
    for task in tasks['data']:
        # print(task['duration'])
        total += task['duration']

    total_hrs = round((total/3600),2)
    data = {
        'title':title,
        'total_hrs':format_hrs(total_hrs),
        'decimal_hrs':str(total_hrs),
        'raw_hrs':total_hrs
    }
    return data    
    
def format_hrs(hrs):
    split_total = modf(float(hrs))
    total_min_part = int(round(split_total[0],2)*60)
    total_hr_part = int(split_total[1]) 
    format_total_min_part = ''
    if total_min_part < 10:
        format_total_min_part = '0'+str(total_min_part)
    else:
        format_total_min_part = str(total_min_part)
    format_hrs = str(total_hr_part)+':'+format_total_min_part
    return format_hrs

def notify(data1,data2):
    total_hrs = str(data1['raw_hrs'] + data2['raw_hrs'])
    data = "\nfor " + data1['title'] + "\ntotal hrs: " + data1['total_hrs'] + \
        "\ndecimal format: " + data1['decimal_hrs'] + \
        "\n\nfor " + data2['title'] + "\ntotal hrs: " + data2['total_hrs'] + \
        "\ndecimal format: " + data2['decimal_hrs'] + \
        "\n\ntotal today " + "\ntotal hrs: " + format_hrs(total_hrs) + \
        "\ndecimal format: " + str(round(float(total_hrs),2)) 
    subp.run(["dunstify", "TrackingTime today", data, '-r', '901'])

divine_data = get_entries(os.getenv('DIVINE_TOKEN'),os.getenv('DIVINE_USER'),'Divine')
eyal_web_data = get_entries(os.getenv('EYALWEB_TOKEN'),os.getenv('EYALWEB_USER'),'Eyal Web')
notify(divine_data,eyal_web_data)
