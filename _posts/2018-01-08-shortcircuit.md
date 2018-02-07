---
layout: post
title: Password Validation Riddle
subtitle: Software analysis
tags: [question, analysis]
---

The two methods below, written in Java, check and validate username and password parameters.

```java
private final String correctUsername = user.getName();
private final String correctPass = user.getPass();

public boolean checkA(String username, String pass) {
    return username.equals(correctUsername) && pass.equals(correctPass);
}

public boolean checkB(String username, String pass) {
    boolean userCorrect = username.equals(correctUsername);
    boolean passCorrect = pass.equals(correctPass);
    return userCorrect && passCorrect;
}
```

Which function is safer, and more importantly, *why*?

<details><summary>Hint</summary>conditional short-circuiting</details>

Three people have already solved this, of which the first two received [Lockheed Martin webcam covers](/2017-10-16-stickers).

The answer can be found here:

<https://github.com/Alex-Werner/http-server-with-auth/blob/2a882d1e093cfc4bec5cb740e0a3a4d4965e9824/lib/http-server-with-auth.js#L73>
