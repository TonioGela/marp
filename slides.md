---
marp: true
theme: toniogela
paginate: true
class: invert
size: 16:9
---

<style>
   :root { 
      /* Overrides here like slide color */
      /* --color-background: #255C46 !important; */
      /* refer to theme/toniogela.scss for variables names */
     }
</style>

<!-- 
_paginate: false 
_footer: "Footer!"
-->

# <!-- fit --> This is the **first** slide :smile:!

[And this is a link](http://google.com)

---

<!-- _paginate: false -->

```scala
def consumer(done: Deferred[IO, Unit]) = for {
  c <- Consumer.setup
  _ <- done.complete(())
  msg <- c.read
  _ <- IO(println(s"Received $msg"))
} yield ()

def producer(done: Deferred[IO, Unit]) = for {
  p <- Producer.setup
  _ <- done.get
  msg = "Msg A"
  _ <- p.write(msg)
  _ <- IO(println(s"Sent $msg"))
} yield ()

def prog = for {
  d <- Deferred[IO, Unit]
  _ <- consumer(d).start
  _ <- producer(d).start
} yield ()
```

---

Render inline **math** such as $ax^2+bc+c$.

$$ I_{xx}=\int\int_Ry^2f(x,y)\cdot{}dydx $$

$$
f(x) = \int_{-\infty}^\infty
    \hat f(\xi)\,e^{2 \pi i \xi x}
    \,d\xi
$$

---

<!-- _backgroundColor: #2E294E -->
<!-- _color: #F49D6E -->

`foo bar` but in purple!

---

![bg left fill blur:3px](images/editors.png)

:drum:
* prima io
* poi io

---

<div data-marpit-fragment>

```markdown
* This
* is
* the fragmented list!
* that appears at once
* if you use --html
* and a div with "data-marpit-fragment"
* but it messes formatting
```

</div>