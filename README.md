# rrange

rrange is a small unix util that, given a probability and a number of trials,
turns your probability into an expected range. For example, let's say you flip a
coin 40 times and want to know if it's biased. We assume the probability is 50%
and run rrange as follows:

```
> rrange 0.5 40
> Around 20 ~ [14, 26]
```

This means that if you flip a coin 40 times and get, say, 24 heads, that's still
no cause for concern, since you are still within the 95% expected confidence
interval.

# Installation

rrange is a Racket script. At present time you need to have Racket installed to
run it.

1. Make sure you have Racket install at `/usr/local/bin/racket`. Alternatively,
if you are using OSX, you can run `ln -s /Applications/Racket\ v6.1.1/bin/racket
/usr/local/bin/racket` to avoid moving the Racket bin.

2. `chmod +x rrange && mv rrange ~/bin/`.

3. Make sure `~/bin/` is in your `PATH`.

# Warning

Don't use this for anything serious. It is probably buggy and is based
on statistical assumptions which may or may not apply in your case.
