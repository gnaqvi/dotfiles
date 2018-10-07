#!/usr/bin/env python3

from gi.repository import Playerctl, GLib

def get_icon(status):
    icons = {
        "Playing": "",
        "Paused": ""
    }

    return icons.get(status, "")

def on_track_change(player, e):
    if 'xesam:artist' in e.keys() and 'xesam:title' in e.keys(): 
        print('{status} {artist} - {title}'.format(
            status=get_icon(player.get_property('status')),
            artist=e['xesam:artist'][0],
            title=e['xesam:title']
        ))

# Get player instance
player = Playerctl.Player(player_name='spotify')

# Initial track information
artist = player.get_artist()
title = player.get_title()
status = get_icon(player.get_property('status'))

print('%s %s - %s' % (status, artist,title))

# Listener for track changes
player.on('metadata', on_track_change)

GLib.MainLoop().run()
