#!/usr/bin/python3
"""
    Queries the Reddit-API and prints the titles
    of the first 10 hot posts listed for a given subreddit
"""

import requests


def top_ten(subreddit):
    """ Prints titles of the 1st 10 hottest posts """
    api_url = "https://www.reddit.com/r/{}/hot.json?limit=10".format(subreddit)

    res = requests.get(api_url, headers={'User-Agent': 'subredditors'},
                       allow_redirects=False)
    titles = [pst['data']['title']
              for pst in res.json().get('data',
                                        {}).get('children', [])]
    print('\n'.join(titles)) if res.status_code == 200 else print("None")
