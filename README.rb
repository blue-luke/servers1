Servers 1
=========

## Learn to

* Learn about something by playing with a toy version

## Introduction

This week we're thinking about networked applications. This means they involve clients and servers.

Today we're going to build a server.

When a developer wants to understand something, it is rare they will read reams of technical documentation. Instead, they will build or find a living example of the thing, and then play with it to see how it behaves.

Remind you of any learning strategies you might have used in the past?

It's time for you to take on this approach.

## Exercise 1

Here's a simple server:

```ruby
require 'socket'

server = TCPServer.new(2345)

socket = server.accept

socket.puts "What do you say?"

they_said = socket.gets.chomp

socket.puts "You said: #{they_said}. Goodbye!"

socket.close
```

Stick that in a ruby file and run it. **It won't do anything.** It'll just sit there. That's expected.

**Open up a second terminal** and type this:

```bash
$ telnet localhost 2345
```

> You may need to run `brew install telnet` to install `telnet` first.

You should see something like:

```
Trying ::1...
Connected to localhost.
Escape character is '^]'.
What do you say?
```

Type something like this:

```
HELLO????? IS THERE ANYBODY OUT THERE??
```

Hit return. What do you see?

## Exercise 2

Try the following challenges, in any order you like:

1. At the moment the server simply quits after the first user disconnects. Make so the server stays running so that the user can reconnect.
2. Make it so the user can stay connected and typing stuff until they type 'quit'
3. Connect to your pair's laptop from your laptop. You'll need the network IP address of the laptop with the server on it for this. See below. **Note that this will not work if you are in a remote cohort.**
4. Create a separate `NoteList` class and make a notes app you can control over the network.

Or anything you like! What do you want to know about how it works? How can you play around with this simple server to find out?

### Getting the IP address

On a mac, run:

```bash
$ ifconfig en0
```

You'll see something like this:

```
en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
	ether 3c:15:c2:e8:1b:f0
	inet6 fe80::1c68:ffdb:3ec8:7caf%en0 prefixlen 64 secured scopeid 0x4
	inet 192.168.48.104 netmask 0xfffffc00 broadcast 192.168.51.255
	nd6 options=201<PERFORMNUD,DAD>
	media: autoselect
	status: active
```

In this case the IP address of this computer is the thing after `inet` — `192.168.48.104`.

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---

**How was this resource?**  
[😫](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=practicals/servers_and_clients/servers.md&prefill_Sentiment=😫) [😕](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=practicals/servers_and_clients/servers.md&prefill_Sentiment=😕) [😐](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=practicals/servers_and_clients/servers.md&prefill_Sentiment=😐) [🙂](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=practicals/servers_and_clients/servers.md&prefill_Sentiment=🙂) [😀](https://airtable.com/shrUJ3t7KLMqVRFKR?prefill_Repository=skills-workshops&prefill_File=practicals/servers_and_clients/servers.md&prefill_Sentiment=😀)  
Click an emoji to tell us.

<!-- END GENERATED SECTION DO NOT EDIT -->