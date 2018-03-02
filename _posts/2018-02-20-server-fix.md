---
title: Server Programming
subtitle: Code Analysis Project
tags: [node, question, analysis]
---

Find OR fix a vulnerability in the *Let's Talk!* server. Be ready to present your findings on March 13.

The instructions and source code are available on [Github](https://github.com/twlinux/lets-talk). 

# Local Deployment

**Git** is the most popular source version control system. If you're into software engineering, understanding *git* will be necessary for your career. [xkcd #1597](https://xkcd.com/1597/)

Installation should be pretty easy, though it takes some time to install (maybe one or two minutes).

![Installation screenshot](/img/install-talk.png)



## Docker Containers

<https://www.docker.com/what-container>

[![logical diagram](https://www.docker.com/sites/default/files/Package%20software.png)](https://www.docker.com/what-container)

> A container image is a lightweight, stand-alone, executable package of a piece of software that includes everything needed to run it: code, runtime, system tools, system libraries, settings. [...] Containers isolate software from its surroundings.

*Let's Talk!* runs within Docker containers, meaning the application is cross-compatible with every platform supported by Docker, such as Windows, MacOS, and Linux.

# JavaScript Notes

The most relevant file is [server.js](https://github.com/twlinux/lets-talk/blob/master/server/server.js), which is dependent on the popular back-end framework [Express](https://expressjs.com/). Below is a very basic Express server example.

{% highlight javascript linenos %}

const express = require(express);
const app = express();
const bodyParser = require('body-parser').urlencoded({ extended: false });

app.get('/', (req, res) => {
    res.send('Hello!');
});

app.post('/', bodyParser, (req, res) => {
    if (!req.body || !req.body.name)
        res.status(400).send('Tell me what your name is!');
    else
        res.send('Your name is: ' + req.body.name);
});

app.use(function (req, res) {
    res.status(404).end();
});

app.listen(8080);
console.log('Server is running at http://localhost:8080');

{% endhighlight %}

Vulnerability analysis will likely be easier for non-programmers. Other people who are taking/have taken AP computer programming 2 shouldn't have too much trouble with understanding the code.
Most of the security flaws in server.js can actually be fixed by changing fewer than three lines of code.


## JavaScript

JavaScript syntax is similar to Java, however the claim that JavaScript is easy for Java developers is bs.

JavaScript is **weakly typed**.

```javascript
let a = 2 + '2' - 5.3;
console.log(a); // 16.7
```

Everything's a variable. Functions are variable.

Function declarations can be abbreviated with **arrow** syntax.

```javascript
let fun = (a, b) => {
    return a + b;
}
let sum = fun;
console.log(sum(3, 18)); // 21
```
