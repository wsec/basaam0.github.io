---
title: Server Programming
subtitle: Code Analysis Project
tags: [node, question, analysis]
---

Find OR fix a vulnerability in the *Let's Talk!* server. Be ready to present your findings on March 13.

The source code is available on [Github](https://github.com/twlinux/lets-talk). 

# Notes

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

## Local Development

[<img src="https://imgs.xkcd.com/comics/git.png" title="xkcd #1597" alt="relevant xkcd #1597" style="float: left; margin-right: 1rem;"/>](https://xkcd.com/1597/)
I've automated installation to make the process as painless as possible. The only software required is a recent version of **docker-compose** (version 1.12.0+, the one in *Ubuntu artful* will not work). and the **Docker engine** itself (release 17.04.0+). Both are Windows compatible!

<https://www.docker.com/what-container>

If working in a UNIX environment, you can take advantage of the wrapper script `url_start.sh`. Otherwise, you must specify the environment variable `PORT` before executing `docker-compose up`.

To reset the SQL database, delete everything in `database/sql`. Or run `./url_start.sh --clean` to reset the database before starting the containers.

I strongly recommend aspiring software engineers to learn about the [git](https://try.github.io/) version control system.

As always, I'm happy to help you with any issues!
