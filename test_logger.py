#-*- coding: utf-8 -*-

import json
from logging import getLogger, config
import random
import time

with open('./log_config.json', 'r') as f:
    log_conf = json.load(f)
config.dictConfig(log_conf)

logger = getLogger(__name__)

for i in range(100):
    r = random.randint(0, 100)
    time.sleep(r/100)
    if r%11 == 0:
        logger.error(f'ALERT: {r}')
    else:
        logger.info(f'no ERROR: {r}')
