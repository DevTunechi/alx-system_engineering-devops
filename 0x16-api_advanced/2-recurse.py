#!/usr/bin/python3
""" Recursive function that queries Reddit-API """

import requests


def recurse(subreddit, hot_list=[], nxt=None):
    """
        Recursive-func a list containing the titles
        of all hot articles for a given subreddit
    """
    path = "https://www.reddit.com/r/{}/hot.json?limit=100".format(subreddit)
    headers = {'User-Agent': 'souf_sadgali/10.0.1'}

    if hot_list is None:
        hot_list = []

    if nxt:
        path += "&after={}".format(nxt)

    try:
        res = requests.get(path, headers=headers, allow_redirects=False)
        if res.status_code == 200:
            children = res.json().get('data', {}).get('children', [])
            hot_list.extend([child['data']['title'] for child in children])
            nxt = res.json().get('data', {}).get('after')

            if nxt:
                return (recurse(subreddit, hot_list, nxt))
            else:
                return (hot_list if hot_list else None)
        else:
            return None
    except Exception:
        return None
