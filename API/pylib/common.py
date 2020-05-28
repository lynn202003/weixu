import requests
import json
from API.cfg import *
from API.pylib.login import login
common=login()
common.user_login(local_url,userName=username,password=password)

