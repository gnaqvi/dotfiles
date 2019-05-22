#!/usr/bin/python

import feedparser
from subprocess import call
import re
import textwrap

nwz = feedparser.parse("https://news.ycombinator.com/rss")

for f in range(0, 1):
    print(nwz.entries[f].title)
    xy = nwz.entries[f].title
