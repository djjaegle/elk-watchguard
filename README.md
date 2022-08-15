#elk-watchguard
This project will build a ELK stack and configure it with a syslog server listening on UDP port 5140. It will also provide a Grok filter config to correctly parse Watchguard Firebox firewall traffic logs.

##Testing Tools
You can test the syslog connection using NetCat command.
**Interactively log messages:**
`nc -4u localhost 5140`

**Send an example log:**
`cat example.log | nc -4u localhost 5140`

Use the [Grok Tester Tool](https://grokdebug.herokuapp.com/) to help build a Grok expression.

