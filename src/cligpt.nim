## ChatGPT CLI
import std/asyncdispatch
from std/strutils import join, repeat
from std/os import sleep
from std/random import randomize, rand
from std/strformat import fmt
import std/terminal

import pkg/dirtygpt

proc typingEcho(s: string; instant = false; fast = false) =
  if instant and not fast:
    stdout.write s
  else:
    for ch in s:
      stdout.write ch
      flushFile stdout
      sleep rand(
        if not fast:
          case ch:
          of '\n': 70..120
          of ' ': 30..60
          else: 5..15
        else: 1..5
      )
  echo ""

proc createDirtyGpt(verbose = false): DirtyGpt =
  if verbose:
    echo "Creating DirtyGPT session"
  result = newDirtyGpt()
  if verbose:
    echo "Waiting at least one userscript client to connect"
  while result.connectedClients == 0:
    poll()
  if verbose:
    echo "Successfully connected!"

proc cliPrompt(texts: seq[string]; instant = true; fast = false; verbose = false) =
  ## Prompts to ChatGPT
  var gpt = createDirtyGpt(verbose)
  let text = texts.join " "
  if text.len > 0:
    let response = waitFor gpt.prompt text
    typingEcho(response, instant, fast)
  stop gpt

proc cliChat(instant = false; fast = false; verbose = false) =
  ## Start chat with ChatGPT
  ## 
  ## Close with "exit"
  var gpt = createDirtyGpt(verbose)
  styledEcho styleReverse, "==Chat started==", bgDefault, "\l"
  block loop:
    while true:
      block prompt:
        stdout.styledWrite fgGreen, "You: "
        let text = readLine stdin
        if text.len > 0:
          if text == "exit":
            break loop
          let response = waitFor gpt.prompt text
          stdout.styledWrite fgBlue, "ChatGPT: "
          typingEcho(response, instant, fast)
          echo ""
  stop gpt
  

when isMainModule:
  import pkg/cligen
  randomize()
  dispatchMulti([
    cliPrompt,
    cmdName = "prompt"
  ], [
    cliChat,
    cmdName = "chat"
  ])
