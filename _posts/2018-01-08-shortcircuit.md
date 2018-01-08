---
layout: post
title: Password Validation Riddle
subtitle: Software analysis
css: /css/code.css
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

Leave a Disqus comment below. The first correct answer will recieve a [Lockheed Martin webcam cover](/2017-10-16-stickers)