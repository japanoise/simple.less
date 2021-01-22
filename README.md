# simple.less - simpler css

This is a [less][less] version of my earlier repo
[motherfucking.css](https://github.com/japanoise/motherfucking.css). That one is
still pretty much perfect, but I never much liked the black-on-white color of it
(although that's the web's default by now). So, I've made a new version which is
basically the exact same only with the colors separated out.

Also, it has a more safe-for-work name.

## Usage

1. Install [less][less] per their instructions.
2. Define variables (globally - see `build.sh`)
3. less → css

If you already have less installed, you can go ahead and run `build.sh`. This
has nice defaults for light & dark colors (`./build.sh light` or `./build.sh
dark`, respectively), or you can use custom colors by defining shell variables:

```bash
fore=black back=white link=green hover=pink bgbak='#eee' bgacc='#555' ./build.sh custom
```

## Meta tag

As always, please use the meta tag in the `<head>` of your webpages to make it
look good on mobile:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

## Copying

All files are released under the ISC license as approved by the FSF; a
permissive license similar to the 2-Clause BSD license. **There is no warranty;
See the LICENSE file for details.**

[less]: http://lesscss.org/#
