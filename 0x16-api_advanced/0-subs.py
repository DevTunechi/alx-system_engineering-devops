#!/usr/bin/python3

import requests

def number_of_subscribers(subreddit):
    # Reddit API endpoint for getting subreddit information
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    
    # Set a custom User-Agent to avoid Too Many Requests error
    headers = {'User-Agent': 'MyBot/0.0.1'}
    
    # Send GET request to the Reddit API
    response = requests.get(url, headers=headers)
    
    # If request was successful (status code 200), extract subscriber count
    if response.status_code == 200:
        data = response.json()
        return data['data']['subscribers']
    else:
        # If subreddit is invalid or any other error, return 0
        return 0

# Example usage
print(number_of_subscribers("python"))  # Output the number of subscribers to the Python subreddit
