#!/usr/bin/env python3.7

import iterm2

async def main(connection):
    all_profiles = await iterm2.PartialProfile.async_query(connection)
    for profile in all_profiles:
        if profile.name == "woneill":
            await profile.async_make_default()
            return

iterm2.run_until_complete(main)
