Postmortem Report



Issue Summary
Outage Duration: May 15, 2024, from 10:00 AM to 12:30 PM GMT+1

Impact: Our e-commerce website was down for 2.5 hours. Users saw "500 Internal Server Error" messages instead of our lovely products. About 75% of users were affected, and we lost around $20,000 in sales.

Root Cause: The problem was a mix-up in the load balancer settings after an update, which made one server work too hard and crash.
Timeline

10:00 AM - Our system screamed for help with a spike in errors.
10:05 AM - On-call engineer started investigating.
10:15 AM - Checked backend server logs and saw high CPU usage.
10:25 AM - Wrong turn: We thought recent code changes were the problem.
10:45 AM - Called in the DevOps superheroes.
11:00 AM - Found the load balancer configuration mess-up.
11:15 AM - Fixed the load balancer settings.
11:30 AM - Restarted the tired backend servers.
12:00 PM - Monitoring confirmed things were back to normal.
12:30 PM - Verified everything was working fine and closed the incident.

Root Cause and Resolution

After updating our load balancer, it started sending too much traffic to one unlucky server. The server couldn't handle it, crashed, and made the website go kaput, lol.

Resolution: The DevOps team fixed the load balancer settings to share the traffic evenly among all servers. They then restarted the crashed server and monitored everything to make sure it was back to normal.

Corrective and Preventative Measures
Improvements and Fixes: Double-Check Settings: Make sure we check load balancer settings thoroughly before any changes.

Automated Tests: Create tests to catch configuration errors before they cause trouble.
Better Monitoring: Improve our monitoring to spot traffic problems early.
Tasks: Update Nginx: Get the latest version of our load balancer software.
Monitor Server Health: Keep a closer eye on server memory and CPU usage.
Configuration Tools: Use tools to automate and check changes to our system.
Regular Load Tests: Test our system regularly to make sure it can handle lots of traffic.
Incident Training: Train our team on how to handle similar problems in the future.

By making these changes, we hope to avoid such issues in the future and keep our website running smoothly for our users. 

This postmortem explains a complex technical issue in simple terms so that anyone, even kids, can understand it. Breaking down the problem, timeline, and solutions with humor and clear language, and, making a complicated job sound easy and relatable.
