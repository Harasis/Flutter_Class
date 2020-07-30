1. First in Rhel we have to configure httpd server
- yum install httpd
- systemctl restart httpd

2. Then we have to create Webpages
- cd /var/www/html     -> location for html webpages
- gedit home.html
-- content

- cd /var/www/cgi-bin     -> location for py webpages
- gedit date.py
-- #!/usr/bin/python3
   import subprocess
   
   print("content-type: text/html")
   print()
   
   cmd = subprocess.getoutput("date")
   print(cmd)

- gedit cal.py
-- #!/usr/bin/python3
   import subprocess
   
   print("content-type: text/html")
   print()
   
   cmd = subprocess.getoutput("cal")
   print(cmd)
   
   
3. Now we make these python webpages executable using
   var/www/cgi-bin]# chmod +x date.py
   var/www/cgi-bin]# chmod +x cal.py
   
   
4. Check in the browser if these webpages are working or not using URL
   - http://IP/home.html
   - http://IP/cgi-bin/date.py
   - http://IP/cgi-bin/cal.py
   
5. Now create the flutter app
   
