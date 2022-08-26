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
import calendar
import subprocess as subp
import argparse

# set cli args
parser = argparse.ArgumentParser()

parser.add_argument("-tf", "--timeframe", type=str, default="today", help="options: today, month, set")
parser.add_argument("-sd", "--startdate", help="date object: 2022-08-01")
parser.add_argument("-ed", "--enddate", help="date object: 2022-08-31")

args = parser.parse_args()

# loading .env variables
load_dotenv()

def get_entries(token,user_id,title):
    today = date.today()
    timeframe = args.timeframe 
    if(timeframe == 'month'):
        start_date = date(today.year,today.month,1)
        lastday = calendar.monthrange(today.year, today.month)[1]
        end_date = date(today.year,today.month,lastday)
    elif (timeframe == 'set'):
        start_date = args.startdate
        end_date = args.enddate
    else:
        start_date = today
        end_date = today
    url = "https://app.trackingtime.co/api/v4/events?filter=USER&id="+user_id+"&from="+str(start_date)+"&to="+str(end_date)
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
    if(args.timeframe == 'set'):
        timeframe = 'manually '+args.startdate+" - "+args.enddate
    else:
        timeframe = args.timeframe
    total_hrs = str(data1['raw_hrs'] + data2['raw_hrs'])
    data = "\nfor " + data1['title'] + "\ntotal hrs: " + data1['total_hrs'] + \
        "\ndecimal format: " + data1['decimal_hrs'] + \
        "\n\nfor " + data2['title'] + "\ntotal hrs: " + data2['total_hrs'] + \
        "\ndecimal format: " + data2['decimal_hrs'] + \
        "\n\ntotal "+ timeframe + "\ntotal hrs: " + format_hrs(total_hrs) + \
        "\ndecimal format: " + str(round(float(total_hrs),2)) 
    subp.run(["dunstify", "TrackingTime "+timeframe, data, '-r', '901'])

divine_data = get_entries(os.getenv('DIVINE_TOKEN'),os.getenv('DIVINE_USER'),'Divine')
eyal_web_data = get_entries(os.getenv('EYALWEB_TOKEN'),os.getenv('EYALWEB_USER'),'Eyal Web')
notify(divine_data,eyal_web_data)
