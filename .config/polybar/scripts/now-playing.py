#!/usr/bin/env python3

from gi.repository import Playerctl, GLib

def on_track_change(player, e):
    if 'xesam:artist' in e.keys() and 'xesam:title' in e.keys():
        print('{artist} - {title}'.format(artist=e['xesam:artist'][0], title=e['xesam:title']))

# Get player instance
player = Playerctl.Player(player_name='spotify')

# Initial track information
artist = player.get_artist()
title = player.get_title()
print('%s - %s' % (artist,title))

# Listener for track changes
player.on('metadata', on_track_change)

GLib.MainLoop().run()
