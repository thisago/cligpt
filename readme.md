<div align=center>

# cligpt

#### Command line interface for ChatGPT

**[About](#about) - [Setup](#setup) - [Usage](#usage)** - [License](#license)

</div>

## About

See this app in action here:
- [Youtube video][youtubeVideo]
- [`cligpt chat`][chatVideo]
- [`cligpt prompt`][promptVideo]

This is a Free ChatGPT CLI application interface.

Core libs used

- [DirtyGPT](https://github.com/thisago/dirtygpt) - Free and dirty ChatGPT web implementation

## Setup

You can install using nimble, the [Nim](https://nim-lang.org) package manager:

```bash
nimble install cligpt
```

In order to DirtyGPT work, you need to install the userscript client in your
browser, in a userscript manager. See the [tutorial at DirtyGPT repository](https://github.com/thisago/dirtygpt#installation)

Then keep open a logged tab at [ChatGPT](https://chat.openai.com) in your browser

## Usage

**Help**

```
$ cligpt --help

ChatGPT CLI
Usage:
  cligpt {SUBCMD}  [sub-command options & parameters]
where {SUBCMD} is one of:
  help    print comprehensive or per-cmd help
  prompt  Prompts to ChatGPT
  chat    Start chat with ChatGPT
```

The usage is very simple:

[**Single prompt**][promptVideo]

```bash
cligpt prompt "what is ram memory?"
```

[**Chat**][chatVideo]

```bash
cligpt chat
```

## License

This CLI application is FOSS, licensed over GPL-3! Enjoy!

[youtubeVideo]: https://youtube.com/watch?v=bx3CoAGnNwo
[chatVideo]: https://asciinema.org/a/gbAxD69b1cUkmVHTEtznVsR27
[promptVideo]: https://asciinema.org/a/VYWg0kFf6OtjKeze83QPMrpWM
