#!/usr/bin/python3
"""
    Queries the Reddit-API and returns num of subs
    for a given subreddit. If an invalid subreddit is given,
    the function should return 0
"""
import requests


def number_of_subscribers(subreddit):
    """ Return number of subscribers """
    res = requests.get(f"https://www.reddit.com/r/{subreddit}/about.json",
                       headers={'User-Agent': 'subs_counter/1.0'},
                       allow_redirects=False)
    return (res.json().get('data').get('subscribers')
            if res.status_code == 200 else 0)
